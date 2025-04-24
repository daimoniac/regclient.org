---
title: regctl registry whoami
layout: single
warning: Auto generated content
---

## Synopsis

Displays the username for a given registry.

```shell
regctl registry whoami [registry]
```

## Examples

```shell
# show the login on Docker Hub
regctl registry whoami

# show the login on another registry
regctl registry whoami registry.example.org
```

## Options from parent commands

```text
      --host stringArray     Registry hosts to add (reg=registry,user=username,pass=password,tls=enabled)
      --logopt stringArray   Log options
      --user-agent string    Override user agent
  -v, --verbosity string     Log level (trace, debug, info, warn, error) (default "WARN")
```
