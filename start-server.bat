@echo off
REM Simple HTTP Server Launcher for Windows
REM This script helps you run the RDP File Editor locally

echo ========================================
echo RDP File Editor - Local Server Launcher
echo ========================================
echo.

REM Check for Python
where python >nul 2>nul
if %ERRORLEVEL% EQU 0 (
    echo [✓] Python detected
    echo Starting server on http://localhost:8080
    echo.
    echo Press Ctrl+C to stop the server
    echo.
    start http://localhost:8080
    python -m http.server 8080
    goto :end
)

REM Check for Python3
where python3 >nul 2>nul
if %ERRORLEVEL% EQU 0 (
    echo [✓] Python3 detected
    echo Starting server on http://localhost:8080
    echo.
    echo Press Ctrl+C to stop the server
    echo.
    start http://localhost:8080
    python3 -m http.server 8080
    goto :end
)

REM Check for Node.js
where node >nul 2>nul
if %ERRORLEVEL% EQU 0 (
    echo [✓] Node.js detected
    where http-server >nul 2>nul
    if %ERRORLEVEL% EQU 0 (
        echo [✓] http-server found
        echo Starting server on http://localhost:8080
        echo.
        echo Press Ctrl+C to stop the server
        echo.
        start http://localhost:8080
        http-server -p 8080
        goto :end
    ) else (
        echo [!] http-server not found
        echo Installing http-server globally...
        npm install -g http-server
        echo Starting server on http://localhost:8080
        echo.
        start http://localhost:8080
        http-server -p 8080
        goto :end
    )
)

REM Check for PHP
where php >nul 2>nul
if %ERRORLEVEL% EQU 0 (
    echo [✓] PHP detected
    echo Starting server on http://localhost:8080
    echo.
    echo Press Ctrl+C to stop the server
    echo.
    start http://localhost:8080
    php -S localhost:8080
    goto :end
)

REM No suitable runtime found
echo [✗] No suitable runtime found!
echo.
echo Please install one of the following:
echo   - Python 3: https://www.python.org/downloads/
echo   - Node.js: https://nodejs.org/
echo   - PHP: https://www.php.net/downloads
echo.
echo Or use a browser extension like "Web Server for Chrome"
echo.
pause
goto :end

:end
