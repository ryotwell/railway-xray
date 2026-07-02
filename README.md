# Railway Xray

Railway Xray is a WebSocket-based multiplexer proxy service that is **small, fast & high performance**. It is designed with a focus on stability and resource efficiency for VLESS, VMess, Trojan, and Shadowsocks protocols.

This application can facilitate various VPN protocols on a single port (`3000`) and also supports automatic Reverse Proxy to a specific website (to hide/disguise the panel).

## Key Features

* **Multi-Protocol**: Automatic detection of Trojan, VMess, VLESS, and Shadowsocks protocols.
* **WebSocket Wrapper**: Naturally wraps VPN connections in standard WebSocket traffic, suitable for deployment on Cloud services (such as Railway, Heroku, AWS, etc.) or behind a CDN (such as Cloudflare).
* **Built-in Reverse Proxy**: You can configure this application to act as a reverse proxy to another web address when accessed via normal HTTP.
* **Automatic Update Checker**: When the application is started, it will automatically check for the availability of a new release in the public repository.

## Protocol Details & Default Paths

This proxy multiplexer uses WebSocket (`ws`) connections for all protocols. To connect using your VPN client (such as Xray-core, v2rayN, NekoBox, etc.), you must set the transport network to **ws** (WebSocket) and use the correct path.

Here are the supported protocols and their default paths (which can be customized via the `.env` file):

| Protocol | Transport | Default WebSocket Path |
|----------|-----------|------------------------|
| VLESS    | ws        | `/vless`               |
| VMess    | ws        | `/vmess`               |
| Trojan   | ws        | `/trojan`              |
| Shadowsocks | ws     | `/ss`                  |

*Note: All traffic runs on the same port (default `3000`). The server automatically inspects the WebSocket payload to parse the connection headers and route traffic accordingly.*

## Installation

### Using the Automatic Script

You can download and install it using the provided bash script (for Linux OS):

Via `curl`:
```bash
bash <(curl -sL https://raw.githubusercontent.com/ryotwell/railway-xray/main/install.sh)
```
*(Note: The URL above assumes the `install.sh` script is located in the public repository `ryotwell/railway-xray` on the `main` branch. If the script is run locally, just execute `bash install.sh`)*

### Manual

1. Download the latest version from the [Releases](https://github.com/ryotwell/railway-xray/releases) section.
2. Grant execution permission: `chmod +x railway-xray-linux-amd64`
3. Move to the execution directory: `sudo mv railway-xray-linux-amd64 /usr/local/bin/railway-xray`

## Configuration

All configurations can be changed via the `.env` file in the working directory where the program is run.

```env
PORT=3000
REVERSE_PRX_TARGET=example.com     # Web domain for reverse proxy (optional)
PATH_VLESS=/vless
PATH_VMESS=/vmess
PATH_TROJAN=/trojan
PATH_SS=/ss
```

## Update Version

If you receive an "Outdated version" warning when running the server, you can run the `update.sh` script:

```bash
bash <(curl -sL https://raw.githubusercontent.com/ryotwell/railway-xray/main/update.sh)
```
*(If the file is run from a local computer, you only need to run `bash update.sh`)*