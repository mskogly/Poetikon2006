#!/usr/bin/env python3
"""
Link Scanner for Poetikon.no
Scans HTML files for broken internal links
"""

import os
import re
from pathlib import Path
from urllib.parse import urljoin, urlparse
from collections import defaultdict

def is_external_link(href):
    """Check if a link is external"""
    return href.startswith(('http://', 'https://', '//', 'mailto:', 'tel:', 'javascript:', '#'))

def resolve_link_path(html_file_path, href, base_dir):
    """Resolve a relative link to an absolute file path"""
    # Skip external links, anchors, and special protocols
    if is_external_link(href):
        return None, True  # external

    # Remove query strings and anchors
    href = href.split('?')[0].split('#')[0]

    if not href:  # Empty after removing anchor
        return None, True

    # Get directory of the HTML file
    html_dir = os.path.dirname(html_file_path)

    # Resolve the link relative to the HTML file's directory
    if href.startswith('/'):
        # Absolute path from site root
        resolved = os.path.join(base_dir, href.lstrip('/'))
    else:
        # Relative path
        resolved = os.path.normpath(os.path.join(html_dir, href))

    return resolved, False  # internal

def extract_links_from_html(html_file):
    """Extract all href links from an HTML file"""
    try:
        with open(html_file, 'r', encoding='utf-8', errors='ignore') as f:
            content = f.read()
    except Exception as e:
        return []

    # Find all href attributes
    # Matches: href="...", href='...', href=...
    pattern = r'href\s*=\s*["\']([^"\']+)["\']'
    links = re.findall(pattern, content, re.IGNORECASE)

    return links

def scan_links(base_dir):
    """Scan all HTML files for broken links"""
    base_path = Path(base_dir)

    print(f"Scanning for links in: {base_dir}")
    print("This may take a moment...\n")

    html_files = list(base_path.rglob('*.html')) + list(base_path.rglob('*.htm'))

    stats = {
        'total_files': len(html_files),
        'total_links': 0,
        'external_links': 0,
        'internal_links': 0,
        'dead_links': 0,
        'working_links': 0
    }

    dead_links = defaultdict(list)

    for html_file in html_files:
        links = extract_links_from_html(html_file)

        for link in links:
            stats['total_links'] += 1

            resolved_path, is_external = resolve_link_path(str(html_file), link, base_dir)

            if is_external:
                stats['external_links'] += 1
                continue

            stats['internal_links'] += 1

            # Check if the resolved path exists
            if resolved_path and os.path.exists(resolved_path):
                stats['working_links'] += 1
            else:
                stats['dead_links'] += 1
                rel_html_file = os.path.relpath(html_file, base_dir)
                dead_links[rel_html_file].append({
                    'href': link,
                    'resolved': resolved_path
                })

    return stats, dead_links

def write_report(stats, dead_links, output_file):
    """Write the scan report to a file"""
    with open(output_file, 'w', encoding='utf-8') as f:
        f.write("LINK SCAN REPORT\n")
        f.write("=" * 80 + "\n\n")

        f.write("STATISTICS:\n")
        f.write(f"  Total HTML files scanned: {stats['total_files']}\n")
        f.write(f"  Total links found: {stats['total_links']}\n")
        f.write(f"  External links (skipped): {stats['external_links']}\n")
        f.write(f"  Internal links: {stats['internal_links']}\n")
        f.write(f"  Working links: {stats['working_links']}\n")
        f.write(f"  Dead/broken links: {stats['dead_links']}\n")

        f.write("\n" + "=" * 80 + "\n\n")

        if dead_links:
            f.write("DEAD LINK REFERENCES:\n\n")

            for html_file in sorted(dead_links.keys()):
                f.write(f"\n{html_file}\n")
                for link_info in dead_links[html_file]:
                    f.write(f"  href: {link_info['href']}\n")
                    f.write(f"  resolved: {link_info['resolved']}\n")
        else:
            f.write("No dead links found!\n")

def main():
    base_dir = os.path.dirname(os.path.abspath(__file__))
    output_file = os.path.join(base_dir, 'link_scan.log')

    stats, dead_links = scan_links(base_dir)
    write_report(stats, dead_links, output_file)

    print("Scan complete!")
    print(f"Total HTML files: {stats['total_files']}")
    print(f"Total links: {stats['total_links']}")
    print(f"Dead links: {stats['dead_links']}")
    print(f"\nResults written to: {output_file}")

if __name__ == '__main__':
    main()
