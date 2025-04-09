# Simple script to start a Python HTTP dev server for this project with PowerShell.
# Guaranteed to work on Windows 10 and above.

# Usage: devserver.ps1 [port]
# If port is not specified, it will default to 8000.
# Example: devserver.ps1 8080
# This will start the server on port 8080.

param (
    [int]$port = 8000
)

function Assert-PythonInstalled {
    # Check if Python is installed
    if (-not (Get-Command python -ErrorAction SilentlyContinue)) {
        Write-Error "Python is not installed or not added to PATH. Please install Python and try again."
        exit 1
    }
}

function Start-DevServer {
    # Start the Python HTTP server
    try {
        python -m http.server $port
    } catch {
        Write-Error "Failed to start the server. Please check if the port is already in use or if Python is configured correctly."
        exit 1
    }
}

function Initialize-Server {
    # Check if Python is installed
    Assert-PythonInstalled

    # Start the server
    Start-DevServer
}

Initialize-Server
