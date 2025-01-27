---
title: regsync completion powershell
layout: single
warning: Auto generated content
---

## Synopsis

Generate the autocompletion script for powershell.

To load completions in your current shell session:

	regsync completion powershell | Out-String | Invoke-Expression

To load completions for every new session, add the output of the above command
to your powershell profile.

```shell
regsync completion powershell [flags]
```

## Options

```text
      --no-descriptions   disable completion descriptions
```

## Options from parent commands

```text
  -c, --config string        Config file
      --logopt stringArray   Log options
  -v, --verbosity string     Log level (trace, debug, info, warn, error) (default "INFO")
```
