---
title: regctl registry config
layout: single
warning: Auto generated content
---

## Synopsis

Displays the configuration used for a registry. Secrets are not included
in the output (e.g. passwords, tokens, and TLS keys).

```shell
regctl registry config [registry] [flags]
```

## Examples

```shell
# show the full config
regctl registry config

# show the configuration for a single registry
regctl registry config registry.example.org

# show the configuration for Docker Hub
regctl registry config docker.io

# show the username used to login to docker hub
regctl registry config docker.io --format '{{.User}}'
```

## Options

```text
      --format string   Format output with go template syntax (default "{{jsonPretty .}}")
```

## Options from parent commands

```text
      --host stringArray     Registry hosts to add (reg=registry,user=username,pass=password,tls=enabled)
      --logopt stringArray   Log options
      --user-agent string    Override user agent
  -v, --verbosity string     Log level (trace, debug, info, warn, error) (default "WARN")
```
