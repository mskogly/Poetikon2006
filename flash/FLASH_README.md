# Poetikon Flash Content - Ruffle Support

## About Flash Files

This site contains Flash (.swf) files that were created years ago. Modern browsers no longer support Adobe Flash Player, but we've added **Ruffle** - a Flash Player emulator that runs in your browser.

## How to View Flash Content

### Option 1: Universal Flash Player
Use the universal flash player page:
```
flash-player.html?file=/path/to/file.swf
```

Example:
```
flash-player.html?file=/flash/potet.swf
```

### Option 2: Direct Embedding
You can also embed Ruffle directly in any HTML page:

```html
<script src="https://unpkg.com/@ruffle-rs/ruffle"></script>
<ruffle-embed src="flash/yourfile.swf" width="800" height="600"></ruffle-embed>
```

## Flash Files on This Site

The site contains Flash animations, interactive art, and other creative content in the `/flash/` directory.

## Compatibility

Ruffle works in all modern browsers:
- Chrome/Edge
- Firefox
- Safari
- Mobile browsers (with varying support)

Some complex Flash files may not work perfectly, as Ruffle is still in development.

## More Information

- Ruffle Project: https://ruffle.rs/
- GitHub: https://github.com/ruffle-rs/ruffle
