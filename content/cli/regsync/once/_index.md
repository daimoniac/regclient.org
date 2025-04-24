---
title: regsync once
layout: single
warning: Auto generated content
---

## Synopsis

Processes each sync command in the configuration file in order.
No jobs are run in parallel, and the command returns after any error or last
sync step is finished.

```shell
regsync once [flags]
```

## Options

```text
      --abort-on-error   Immediately abort on any errors
  -c, --config string    Config file
      --missing          Only copy tags that are missing on target
```

## Options from parent commands

```text
      --logopt stringArray   Log options
  -v, --verbosity string     Log level (trace, debug, info, warn, error) (default "INFO")
```
