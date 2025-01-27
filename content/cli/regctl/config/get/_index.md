---
title: regctl config get
layout: single
warning: Auto generated content
---

## Synopsis

Displays the configuration. Passwords are not included in the output.

```shell
regctl config get [flags]
```

## Examples

```shell
# retrieve the full config
regctl config get

# display the filename of the config
regctl config get --format '{{.Filename}}'
```

## Options

```text
      --format string   format the output with Go template syntax (default "{{ printPretty . }}")
```

## Options from parent commands

```text
      --host stringArray     Registry hosts to add (reg=registry,user=username,pass=password,tls=enabled)
      --logopt stringArray   Log options
      --user-agent string    Override user agent
  -v, --verbosity string     Log level (trace, debug, info, warn, error) (default "WARN")
```
