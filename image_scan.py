#!/usr/bin/env python3
"""
Scan HTML files for image src attributes and check if the files exist.
Creates a log file with dead image links.
"""

import os
import re
from pathlib import Path
from urllib.parse import unquote

def find_html_files(root_dir):
    """Find all HTML files in the directory tree."""
    html_files = []
    for root, dirs, files in os.walk(root_dir):
        # Skip hidden directories and common non-content directories
        dirs[:] = [d for d in dirs if not d.startswith('.') and d not in ['node_modules', 'venv', '__pycache__']]
        for file in files:
            if file.endswith(('.html', '.htm')):
                html_files.append(os.path.join(root, file))
    return html_files

def extract_image_sources(html_content):
    """Extract all image src attributes from HTML content."""
    # Match img tags with src attributes
    img_pattern = r'<img[^>]+src=["\']([^"\']+)["\']'
    # Also match background images in style attributes
    bg_pattern = r'background(?:-image)?:\s*url\(["\']?([^"\')]+)["\']?\)'

    sources = []
    sources.extend(re.findall(img_pattern, html_content, re.IGNORECASE))
    sources.extend(re.findall(bg_pattern, html_content, re.IGNORECASE))

    return sources

def is_external_url(src):
    """Check if the source is an external URL."""
    return src.startswith(('http://', 'https://', '//', 'data:'))

def resolve_path(html_file, src, root_dir):
    """Resolve relative path to absolute file path."""
    # Remove query strings and fragments
    src = src.split('?')[0].split('#')[0]

    # Decode URL encoding
    src = unquote(src)

    html_dir = os.path.dirname(html_file)

    if src.startswith('/'):
        # Absolute path from root
        resolved = os.path.join(root_dir, src.lstrip('/'))
    else:
        # Relative path
        resolved = os.path.join(html_dir, src)

    return os.path.normpath(resolved)

def scan_images(root_dir):
    """Scan all HTML files for image sources and check if they exist."""
    root_dir = os.path.abspath(root_dir)
    html_files = find_html_files(root_dir)

    dead_images = []
    stats = {
        'total_html_files': len(html_files),
        'total_images': 0,
        'external_images': 0,
        'dead_images': 0,
        'existing_images': 0
    }

    for html_file in html_files:
        try:
            with open(html_file, 'r', encoding='utf-8', errors='ignore') as f:
                content = f.read()

            sources = extract_image_sources(content)
            stats['total_images'] += len(sources)

            for src in sources:
                if is_external_url(src):
                    stats['external_images'] += 1
                    continue

                resolved_path = resolve_path(html_file, src, root_dir)

                if not os.path.exists(resolved_path):
                    stats['dead_images'] += 1
                    rel_html = os.path.relpath(html_file, root_dir)
                    dead_images.append({
                        'html_file': rel_html,
                        'src': src,
                        'resolved_path': resolved_path
                    })
                else:
                    stats['existing_images'] += 1

        except Exception as e:
            print(f"Error processing {html_file}: {e}")

    return dead_images, stats

def write_log(dead_images, stats, output_file):
    """Write the results to a log file."""
    with open(output_file, 'w', encoding='utf-8') as f:
        f.write("IMAGE SOURCE SCAN REPORT\n")
        f.write("=" * 80 + "\n\n")

        f.write("STATISTICS:\n")
        f.write(f"  Total HTML files scanned: {stats['total_html_files']}\n")
        f.write(f"  Total image references: {stats['total_images']}\n")
        f.write(f"  External images (skipped): {stats['external_images']}\n")
        f.write(f"  Existing images: {stats['existing_images']}\n")
        f.write(f"  Dead/missing images: {stats['dead_images']}\n")
        f.write("\n" + "=" * 80 + "\n\n")

        if dead_images:
            f.write("DEAD IMAGE REFERENCES:\n\n")

            # Group by HTML file
            by_file = {}
            for item in dead_images:
                html_file = item['html_file']
                if html_file not in by_file:
                    by_file[html_file] = []
                by_file[html_file].append(item)

            for html_file in sorted(by_file.keys()):
                f.write(f"\n{html_file}\n")
                for item in by_file[html_file]:
                    f.write(f"  src: {item['src']}\n")
                    f.write(f"  resolved: {item['resolved_path']}\n")
        else:
            f.write("No dead image references found!\n")

def main():
    root_dir = os.path.dirname(os.path.abspath(__file__))
    output_file = os.path.join(root_dir, 'image_scan.log')

    print(f"Scanning for images in: {root_dir}")
    print("This may take a moment...")

    dead_images, stats = scan_images(root_dir)
    write_log(dead_images, stats, output_file)

    print(f"\nScan complete!")
    print(f"Total HTML files: {stats['total_html_files']}")
    print(f"Total images: {stats['total_images']}")
    print(f"Dead images: {stats['dead_images']}")
    print(f"\nResults written to: {output_file}")

if __name__ == '__main__':
    main()
