---
title: regctl registry set
layout: single
warning: Auto generated content
---

## Synopsis

Set or modify the configuration of a registry.

```shell
regctl registry set <registry> [flags]
```

## Examples

```shell
# configure a registry for HTTP
regctl registry set localhost:5000 --tls disabled

# configure a self signed certificate
regctl registry set registry.example.org --cacert "$(cat reg-ca.crt)"

# specify a local mirror for Docker Hub
regctl registry set docker.io --mirror hub-mirror.example.org

# specify the requests per sec throttle
regctl registry set quay.io --req-per-sec 10
```

## Options

```text
      --api-opts stringArray   List of options (key=value))
      --blob-chunk int         Blob chunk size
      --blob-max int           Blob size before switching to chunked push, -1 to disable
      --cacert string          CA Certificate (not a filename, use "$(cat ca.pem)" to use a file)
      --client-cert string     Client certificate for mTLS (not a filename, use "$(cat client.pem)" to use a file)
      --client-key string      Client key for mTLS (not a filename, use "$(cat client.key)" to use a file)
      --cred-helper string     Credential helper (full binary name, including docker-credential- prefix)
      --hostname string        Hostname or ip with port
      --mirror stringArray     List of mirrors (registry names)
      --path-prefix string     Prefix to all repositories
      --priority uint          Priority (for sorting mirrors)
      --repo-auth              Separate auth requests per repository instead of per registry
      --req-concurrent int     Concurrent requests
      --req-per-sec float      Requests per second
      --skip-check             Skip checking connectivity to the registry
      --tls string             TLS (enabled, insecure, disabled)
```

## Options from parent commands

```text
      --host stringArray     Registry hosts to add (reg=registry,user=username,pass=password,tls=enabled)
      --logopt stringArray   Log options
      --user-agent string    Override user agent
  -v, --verbosity string     Log level (trace, debug, info, warn, error) (default "WARN")
```
