# Saibius

**Instant File Sharing for Server Management**

A blazing-fast, lightweight web server designed for instant file and directory sharing. Built with Rust's performance-first architecture, Saibius serves files of any size over HTTP without authentication, making it perfect for server management and rapid data transfer.

https://github.com/user-attachments/assets/f413ad10-67d7-4d6b-b981-d45dbcfb6eed  

## Why Saibius?

- **Zero-Copy Performance**: Leverages Linux's `sendfile` system call for memory-efficient file transfers
- **Dynamic Port Allocation**: Automatically finds available ports when your preferred port is occupied
- **Range Request Support**: Resume downloads and stream large files efficiently with HTTP partial content
- **Instant Setup**: No configuration required - share files in seconds
- **Directory Browsing**: Beautiful, intuitive web interface for directory navigation
- **Smart IP Detection**: Automatically displays both localhost and LAN access URLs

## Quick Start  

### Installation
Sign up, purchase the desired license, and download it from the [accounts](https://saibius.com/accounts) page.  

### Basic Usage

Share a directory:
```bash
saibius --file /path/to/directory
```

Share a single file:
```bash
saibius --file /path/to/file.txt
```

Specify custom port and host:
```bash
saibius --file /path/to/directory --port 8080 --host 0.0.0.0
```

## Features

### Performance Optimizations

Saibius implements several cutting-edge performance optimizations:

#### Zero-Copy Transfer
- Files under 1MB use `sendfile` for zero-copy kernel-space transfers
- Larger files are streamed using optimized 64KB buffers
- Minimizes memory usage and CPU overhead

#### Smart Buffering
- Adaptive buffer sizes based on file dimensions
- Asynchronous I/O for non-blocking operations
- Memory-mapped file operations where beneficial

#### Range Request Support
- Full HTTP/1.1 Range header implementation (RFC 7233)
- Supports seeking in large files and video streaming
- Client-optimized download resumption

### Dynamic Network Configuration

#### Automatic Port Allocation
If your preferred port is busy, Saibius automatically scans for the next available port:
```
Port 3200 was in use, automatically using port 3201
Server starting at http://127.0.0.1:3201/
```

#### Smart IP Detection
Saibius automatically detects and displays your LAN IP for easy network access:
```bash
Server starting at http://127.0.0.1:3200/
Server also accessible at http://192.168.1.100:3200/
```

## Command Line Options

| Option | Short | Description | Default |
|--------|-------|-------------|---------|
| `--file` | `-f` | Path to file or directory to share | **Required** |
| `--port` | `-p` | Port to bind to | 3200 |
| `--host` | `-h` | Host address to bind to | 127.0.0.1 |

## Usage Examples

### After Download Saibius:

```bash
# Share your home directory
./saibius --file ~/

# Share a specific project
.saibius --file ./my-project --port 9000

# Make files available on your localhost network
# Saibius binds to 0.0.0.0 by default.
.saibius --file ./downloads --host 127.0.0.1 --port 8080

# Share a single large video file
./saibius --file ./movie.mp4
```

### Integration with curl and wget

Saibius automatically detects command-line tools and provides direct file access:

```bash
# Download with curl
curl http://localhost:3200/filename.txt

# Download with wget
wget http://localhost:3200/filename.txt

# Stream with range request (download first 1MB)
curl -r 0-1048575 http://localhost:3200/largefile.zip
```

## Technology Stack

- **Runtime**: Tokio asynchronous runtime
- **Web Framework**: Warp for high-performance HTTP handling
- **Core Language**: Rust 2024 Edition
- **File I/O**: Async-optimized with zero-copy support
- **Memory Management**: Minimal copying with efficient streaming

## Security Considerations

**⚠️ Important**: Saibius is designed for trusted network environments and server management tasks. It:

- Serves files without authentication
- Provides open access to shared directories
- Is intended for local network use only
- Should be used behind firewalls in production environments

## Directory Features

When sharing directories, Saibius provides:

- **Browsable Interface**: Clean, responsive web directory listings
- **File Metadata**: Size display and MIME type detection
- **Navigation**: Breadcrumb navigation for subdirectories
- **URL Encoding**: Safe handling of special characters in filenames
- **Error Pages**: User-friendly 404 and error pages

## Error Handling

Saibius implements robust error handling:

- Graceful port conflict resolution
- Comprehensive file permission checks
- Path traversal protection
- Detailed error messages with suggested solutions

## License

This software is proprietary and all rights are reserved.  
No part of this project, including its source code, binaries, or documentation,  
may be reproduced, modified, or distributed without explicit written permission  
from the copyright holder.

See the LICENSE (EULA) file for full details.

---

**Saibius** - Because your files deserve to fly. 🚀
