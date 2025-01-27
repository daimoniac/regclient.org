---
title: regsync completion zsh
layout: single
warning: Auto generated content
---

## Synopsis

Generate the autocompletion script for the zsh shell.

If shell completion is not already enabled in your environment you will need
to enable it.  You can execute the following once:

	echo "autoload -U compinit; compinit" >> ~/.zshrc

To load completions in your current shell session:

	source <(regsync completion zsh)

To load completions for every new session, execute once:

#### Linux:

	regsync completion zsh > "${fpath[1]}/_regsync"

#### macOS:

	regsync completion zsh > $(brew --prefix)/share/zsh/site-functions/_regsync

You will need to start a new shell for this setup to take effect.

```shell
regsync completion zsh [flags]
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
