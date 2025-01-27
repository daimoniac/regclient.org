---
title: regctl manifest diff
layout: single
warning: Auto generated content
---

## Synopsis

Show the differences between two image manifests

```shell
regctl manifest diff <image_ref> <image_ref> [flags]
```

## Examples

```shell
# compare the scratch and alpine images
regctl manifest diff \
  ghcr.io/regclient/regctl:latest \
	ghcr.io/regclient/regctl:alpine

# compare two digests and show the full context
regctl manifest diff --context-full \
  ghcr.io/regclient/regctl@sha256:9b7057d06ce061cefc7a0b7cb28cad626164e6629a1a4f09cee4b4d400c9aef0 \
  ghcr.io/regclient/regctl@sha256:4d113b278bd425d094848ba5d7b4d6baca13a2a9d20d265b32bc12020d501002
```

## Options

```text
      --context int    Lines of context (default 3)
      --context-full   Show all lines of context
```

## Options from parent commands

```text
      --host stringArray     Registry hosts to add (reg=registry,user=username,pass=password,tls=enabled)
      --logopt stringArray   Log options
      --user-agent string    Override user agent
  -v, --verbosity string     Log level (trace, debug, info, warn, error) (default "WARN")
```
