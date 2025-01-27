---
title: regctl artifact put
layout: single
warning: Auto generated content
---

## Synopsis

Upload artifacts to the registry.

```shell
regctl artifact put <reference> [flags]
```

## Aliases

- push

## Examples

```shell
# push a simple artifact by name
regctl artifact put \
  --artifact-type application/example.test \
  registry.example.com/repo:artifact <text.txt

# push an artifact with a config
regctl artifact put \
  --config-type application/vnd.example.config.v1+json \
  --config-file config.json \
  --file-media-type application/vnd.example.data.v1.tar+gzip \
  --file data.tgz \
  registry.example.com/repo:artifact

# push an SBOM that is a referrer to an existing image
regctl artifact put \
  --artifact-type application/spdx+json \
  --subject registry.example.com/repo:v1 \
  < spdx.json
```

## Options

```text
      --annotation stringArray        Annotation to include on manifest
      --artifact-type string          Artifact type (recommended)
      --by-digest                     Push manifest by digest instead of tag
      --config-file string            Filename for config content
      --config-type string            Config mediaType
      --external string               Push referrers to a separate repository
  -f, --file stringArray              Artifact filename
  -m, --file-media-type stringArray   Set the mediaType for the individual files
      --file-title                    Include a title annotation with the filename
      --format string                 Format output with go template syntax
      --index                         Create/append artifact to an index
  -p, --platform string               Specify platform of a subject (e.g. linux/amd64 or local)
      --strip-dirs                    Strip directories from filenames in file-title
      --subject string                Set the subject to a reference (used for referrer queries)
```

## Options from parent commands

```text
      --host stringArray     Registry hosts to add (reg=registry,user=username,pass=password,tls=enabled)
      --logopt stringArray   Log options
      --user-agent string    Override user agent
  -v, --verbosity string     Log level (trace, debug, info, warn, error) (default "WARN")
```
