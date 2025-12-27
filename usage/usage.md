# Saibius

**Instant File Sharing for Server Management**

Below is an overview of Saibius use cases. For more detailed information, please refer to the full report.  

![Saibius Image](../image/thumb.png)

### Use Case 1 : Instant file Sharing
Share files instantly with nearby systems from your current OS.  
Saibius requires no installation and no configuration — just run it and start sharing.  

![Instant file Sharing](../image/use-case/chap1.png)

A single command is enough:  
```bash
./saibius --file ./share
```

This command immediately exposes the specified file or directory over HTTP,
making it accessible to other systems on the same network or via a reachable address.  

No setup. No global install. No persistent services.  

### Use Case 2 : Automatic Port Resolution
Saibius automatically detects port conflicts and selects an available port
without requiring user intervention.  

![Automatic Port Resolution](../image/use-case/chap2-1.png)

Port 3200 was in use, automatically using port 3201  

This allows multiple instances of Saibius to run in parallel on the same system,
making it ideal for CI pipelines, local testing, and internal distribution.

### Use Case 3 : Explicit Port Binding
For environments that require fixed network configurations,
Saibius allows explicit port binding via the `--port` option.  

![Explicit Port Binding](../image/use-case/chap3.png)

```bash
./saibius --file ./share --port (Your-port-number-here)
```

### Use Case 4 : Localhost-Only Access
In scenarios where external network access must be strictly blocked,
Saibius can be bound to the local loopback interface only.

By explicitly setting the host to `127.0.0.1`, the shared files become accessible
exclusively from the local machine.  

```bash
./saibius --file ./share --host 127.0.0.1
```

This prevents external port exposure and ensures that file access is limited
to local processes and users.

![Localhost-Only Access](../image/use-case/chap4.png)

This approach is ideal for local testing, CI pipelines, and security-sensitive
environments where network isolation is required.  

### Use case 5 : 

Saibius does not require global installation. 
Download it when needed, use it, and remove it afterward.

You can always fetch the latest binary from the website.  

