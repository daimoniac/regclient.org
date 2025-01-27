---
title: regctl blob delete
layout: single
warning: Auto generated content
---

## Synopsis

Delete a blob from the registry. This is rarely needed since registries should
have their own garbage collection algorithms and may clean unreferenced blobs
automatically. This command is useful for repairing a corrupt registry. The
blob or layer digest can be found in the image manifest.

```shell
regctl blob delete <repository> <digest>
```

## Aliases

- del
- rm

## Examples

```shell
# delete a blob
regctl blob delete registry.example.org/repo \
  sha256:a58ecd4f0c864650a4286c3c2d49c7219a3f2fc8d7a0bf478aa9834acfe14ae7
```

## Options from parent commands

```text
      --host stringArray     Registry hosts to add (reg=registry,user=username,pass=password,tls=enabled)
      --logopt stringArray   Log options
      --user-agent string    Override user agent
  -v, --verbosity string     Log level (trace, debug, info, warn, error) (default "WARN")
```
