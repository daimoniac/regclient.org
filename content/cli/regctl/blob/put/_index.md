---
title: regctl blob put
layout: single
warning: Auto generated content
---

## Synopsis

Upload a blob to a repository. Stdin must be the blob contents. The output
is the digest of the blob.

```shell
regctl blob put <repository> [flags]
```

## Aliases

- push

## Examples

```shell
# push a blob
regctl blob put registry.example.org/repo <layer.tgz
```

## Options

```text
      --digest string   Set the expected digest
      --format string   Format output with go template syntax (default "{{println .Digest}}")
```

## Options from parent commands

```text
      --host stringArray     Registry hosts to add (reg=registry,user=username,pass=password,tls=enabled)
      --logopt stringArray   Log options
      --user-agent string    Override user agent
  -v, --verbosity string     Log level (trace, debug, info, warn, error) (default "WARN")
```
