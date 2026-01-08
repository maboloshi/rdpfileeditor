# RDP File Editor

A web-based tool to create and edit Remote Desktop Protocol (RDP) files with multi-language support.

## Features

- ✅ Create and edit RDP files through a user-friendly interface
- ✅ Multi-language support (English and Chinese)
- ✅ Automatic browser language detection
- ✅ 87 RDP configuration options across 7 categories
- ✅ Load existing RDP files for editing
- ✅ Save configured RDP files

## Multi-Language Support

The application automatically detects your browser language and displays the interface in:
- **English** (default for all languages)
- **中文** (Chinese - for zh, zh-CN, zh-TW)

You can manually switch languages using the dropdown in the top-right corner.

## How to Use

### Option 1: Online Deployment (Recommended)

Deploy the files to any web server:

1. **GitHub Pages**:
   - Enable GitHub Pages in your repository settings
   - Access via: `https://[username].github.io/[repo-name]/`

2. **Static Hosting Services**:
   - Netlify: Drag and drop the folder
   - Vercel: Connect your GitHub repository
   - Cloudflare Pages: Deploy directly from Git

3. **Traditional Web Server**:
   - Upload all files to your web server
   - Ensure `index.html`, `rdpoptions.json`, and `rdpoptions.zh.json` are in the same directory
   - Access via your web server URL

### Option 2: Local Development Server

**Important**: Opening `index.html` directly in a browser (file:///) will cause CORS errors. You must use a local web server.

#### Method A: Python (Recommended - Works on all platforms)

If you have Python installed:

```bash
# Python 3.x
python -m http.server 8080

# Python 2.x
python -m SimpleHTTPServer 8080
```

Then open: `http://localhost:8080`

#### Method B: Node.js

If you have Node.js installed:

```bash
# Install http-server globally (one-time)
npm install -g http-server

# Run server
http-server -p 8080
```

Then open: `http://localhost:8080`

#### Method C: PHP

If you have PHP installed:

```bash
php -S localhost:8080
```

Then open: `http://localhost:8080`

#### Method D: VS Code Live Server Extension

1. Install "Live Server" extension in VS Code
2. Right-click on `index.html`
3. Select "Open with Live Server"

#### Method E: Browser Extensions

Some browsers allow local file access:

**Chrome/Edge**:
```bash
# Windows
chrome.exe --allow-file-access-from-files

# Mac
open -a "Google Chrome" --args --allow-file-access-from-files

# Linux
google-chrome --allow-file-access-from-files
```

⚠️ **Warning**: This reduces browser security. Only use for development.

### Option 3: Single-File Standalone Version

For a version that works without a server, you can inline all data:

See the "Creating a Standalone Version" section below.

## Project Structure

```
rdpfileeditor/
├── index.html              # Main application (includes UI translations)
├── rdpoptions.json         # English RDP options and descriptions
├── rdpoptions.zh.json      # Chinese RDP options and descriptions
├── rdp.png                 # Application icon
└── README.md               # This file
```

## Creating a Standalone Version

If you need a truly standalone version that works with `file:///` protocol, you can embed the JSON data:

1. Convert JSON files to JavaScript objects in `index.html`
2. Replace `fetch()` calls with direct object access
3. This will increase the HTML file size but eliminate CORS issues

Contact the maintainers if you need assistance with this approach.

## Browser Compatibility

- Chrome/Edge: ✅ Supported
- Firefox: ✅ Supported
- Safari: ✅ Supported
- Opera: ✅ Supported

Requires a modern browser with ES6 support and Vue 3 compatibility.

## Translation Files

### UI Translations (Inline)
- Embedded in `index.html` for instant loading
- 13 translation keys for interface elements

### RDP Options Translations (External)
- `rdpoptions.json` - English descriptions (87 options)
- `rdpoptions.zh.json` - Chinese descriptions (87 options)

## Adding New Languages

To add a new language (e.g., Spanish):

1. Add UI translations to `translations` object in `index.html`:
```javascript
es: {
    title: "Editor de archivos RDP",
    subtitle: "Crear y editar archivos RDP.",
    // ... add all 13 keys
}
```

2. Create `rdpoptions.es.json` with translated RDP option descriptions

3. Update language selector in `index.html`:
```html
<option value="es">Español</option>
```

4. Update `fetchOptions()` method to handle the new language

## Troubleshooting

### CORS Error when opening file:///

**Problem**: Browser blocks file:/// requests for security

**Solution**: Use a local web server (see "Local Development Server" section above)

### Translations not loading

**Problem**: Translation files not found

**Solution**: 
- Ensure all files are in the same directory
- Check browser console for error messages
- Verify file names are correct (case-sensitive on some systems)

### Language not auto-detecting

**Problem**: Browser language not recognized

**Solution**:
- Manually select language from dropdown
- Check browser language settings
- Only `zh/zh-CN/zh-TW` auto-switch to Chinese, others default to English

## Contributing

Contributions are welcome! Please feel free to submit pull requests for:
- New language translations
- Bug fixes
- Feature improvements
- Documentation updates

## License

See repository license file.

## Credits

Based on [RDP File Editor](https://github.com/kimmknight/rdpfileeditor) by kimmknight.
