---
title: regctl completion zsh
layout: single
warning: Auto generated content
---

## Synopsis

Generate the autocompletion script for the zsh shell.

If shell completion is not already enabled in your environment you will need
to enable it.  You can execute the following once:

	echo "autoload -U compinit; compinit" >> ~/.zshrc

To load completions in your current shell session:

	source <(regctl completion zsh)

To load completions for every new session, execute once:

#### Linux:

	regctl completion zsh > "${fpath[1]}/_regctl"

#### macOS:

	regctl completion zsh > $(brew --prefix)/share/zsh/site-functions/_regctl

You will need to start a new shell for this setup to take effect.

```shell
regctl completion zsh [flags]
```

## Options

```text
      --no-descriptions   disable completion descriptions
```

## Options from parent commands

```text
      --host stringArray     Registry hosts to add (reg=registry,user=username,pass=password,tls=enabled)
      --logopt stringArray   Log options
      --user-agent string    Override user agent
  -v, --verbosity string     Log level (trace, debug, info, warn, error) (default "WARN")
```
