# verify-deployment

> Censorship Resistant Tooling (Server/Client)

[see https://github.com/waysact/webpack-subresource-integrity](https://github.com/waysact/webpack-subresource-integrity)

## git deployments 

> TODO

## verifying deployments

> TODO

## Connectivity 


> PACFILE based SOCKS5 Proxyin'g

### Proxy.pac

```json
["Content-Type", "application/x-ns-proxy-autoconfig"]
```
```pac
function FindProxyForURL(url, host) {
	if(shExpMatch(host, "{{.HostMatch}}")) {
		return "SOCKS5 {{.SocksDestination}}";
	}
	{{range $key, $value := .Aliases}}
	if (host == "{{$key}}") {
		return "SOCKS5 {{.SocksDestination}}";
	}
	{{end}}
	return "DIRECT";
}
```
To configure your Mac to use the proxy:

1. Open System Preferences
2. Select Network
3. Click the 'Advanced' button
4. Select the Proxies tab
5. Click the 'Automatic Proxy Configuration' check box
6. Enter 'http://localhost:8080/proxy.pac' in the URL box
7. Remove `*.local` from the 'Bypass proxy settings for these Hosts & Domains'

