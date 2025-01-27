---
title: regctl image digest
layout: single
warning: Auto generated content
---

## Synopsis

show digest for pinning, same as "manifest digest"

```shell
regctl image digest <image_ref> [flags]
```

## Examples

```shell
# get the digest for the latest regctl image
regctl image digest ghcr.io/regclient/regctl
```

## Options

```text
  -p, --platform string   Specify platform (e.g. linux/amd64 or local, requires a get request)
      --require-list      Fail if manifest list is not received
```

## Options from parent commands

```text
      --host stringArray     Registry hosts to add (reg=registry,user=username,pass=password,tls=enabled)
      --logopt stringArray   Log options
      --user-agent string    Override user agent
  -v, --verbosity string     Log level (trace, debug, info, warn, error) (default "WARN")
```
