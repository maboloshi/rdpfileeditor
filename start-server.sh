#!/bin/bash
# Simple HTTP Server Launcher for macOS/Linux
# This script helps you run the RDP File Editor locally

echo "========================================"
echo "RDP File Editor - Local Server Launcher"
echo "========================================"
echo ""

# Check for Python
if command -v python3 &> /dev/null; then
    echo "[✓] Python3 detected"
    echo "Starting server on http://localhost:8080"
    echo ""
    echo "Press Ctrl+C to stop the server"
    echo ""
    
    # Try to open browser (macOS and Linux)
    if [[ "$OSTYPE" == "darwin"* ]]; then
        open "http://localhost:8080" 2>/dev/null || true
    elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
        xdg-open "http://localhost:8080" 2>/dev/null || true
    fi
    
    python3 -m http.server 8080
    exit 0
fi

if command -v python &> /dev/null; then
    echo "[✓] Python detected"
    echo "Starting server on http://localhost:8080"
    echo ""
    echo "Press Ctrl+C to stop the server"
    echo ""
    
    # Try to open browser
    if [[ "$OSTYPE" == "darwin"* ]]; then
        open "http://localhost:8080" 2>/dev/null || true
    elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
        xdg-open "http://localhost:8080" 2>/dev/null || true
    fi
    
    python -m http.server 8080 || python -m SimpleHTTPServer 8080
    exit 0
fi

# Check for Node.js
if command -v node &> /dev/null; then
    echo "[✓] Node.js detected"
    
    if command -v http-server &> /dev/null; then
        echo "[✓] http-server found"
    else
        echo "[!] http-server not found"
        echo "Installing http-server globally..."
        npm install -g http-server
    fi
    
    echo "Starting server on http://localhost:8080"
    echo ""
    echo "Press Ctrl+C to stop the server"
    echo ""
    
    # Try to open browser
    if [[ "$OSTYPE" == "darwin"* ]]; then
        open "http://localhost:8080" 2>/dev/null || true
    elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
        xdg-open "http://localhost:8080" 2>/dev/null || true
    fi
    
    http-server -p 8080
    exit 0
fi

# Check for PHP
if command -v php &> /dev/null; then
    echo "[✓] PHP detected"
    echo "Starting server on http://localhost:8080"
    echo ""
    echo "Press Ctrl+C to stop the server"
    echo ""
    
    # Try to open browser
    if [[ "$OSTYPE" == "darwin"* ]]; then
        open "http://localhost:8080" 2>/dev/null || true
    elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
        xdg-open "http://localhost:8080" 2>/dev/null || true
    fi
    
    php -S localhost:8080
    exit 0
fi

# No suitable runtime found
echo "[✗] No suitable runtime found!"
echo ""
echo "Please install one of the following:"
echo "  - Python 3: https://www.python.org/downloads/"
echo "  - Node.js: https://nodejs.org/"
echo "  - PHP: https://www.php.net/downloads"
echo ""
echo "Or deploy to a web server (see README.md)"
echo ""
exit 1
