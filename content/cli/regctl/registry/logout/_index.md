---
title: regctl registry logout
layout: single
warning: Auto generated content
---

## Synopsis

Remove registry credentials from the configuration.

```shell
regctl registry logout <registry>
```

## Examples

```shell
# logout from Docker Hub
regctl registry logout

# logout from a specific registry
regctl registry logout registry.example.org
```

## Options from parent commands

```text
      --host stringArray     Registry hosts to add (reg=registry,user=username,pass=password,tls=enabled)
      --logopt stringArray   Log options
      --user-agent string    Override user agent
  -v, --verbosity string     Log level (trace, debug, info, warn, error) (default "WARN")
```
