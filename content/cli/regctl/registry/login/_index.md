---
title: regctl registry login
layout: single
warning: Auto generated content
---

## Synopsis

Provide login credentials for a registry. This may not be necessary if you
have already logged in with docker.

```shell
regctl registry login <registry> [flags]
```

## Examples

```shell
# login to Docker Hub
regctl registry login

# login to registry
regctl registry login registry.example.org

# login to GHCR with a provided password
echo "${token}" | regctl registry login ghcr.io -u "${username}" --pass-stdin
```

## Options

```text
  -p, --pass string   Password
      --pass-stdin    Read password from stdin
      --skip-check    Skip checking connectivity to the registry
  -u, --user string   Username
```

## Options from parent commands

```text
      --host stringArray     Registry hosts to add (reg=registry,user=username,pass=password,tls=enabled)
      --logopt stringArray   Log options
      --user-agent string    Override user agent
  -v, --verbosity string     Log level (trace, debug, info, warn, error) (default "WARN")
```
