<h1 align="center">
  ✍️ + 🚀
  <br>Spaceship Vi-mode<br>
</h1>

<h4 align="center">
  Vi-mode section for Spaceship prompt
</h4>

<p align="center">
  <a href="https://github.com/spaceship-prompt/spaceship-vi-mode/releases">
    <img src="https://img.shields.io/github/v/release/spaceship-prompt/spaceship-vi-mode.svg?style=flat-square"
      alt="GitHub Release" />
  </a>

  <a href="https://github.com/spaceship-prompt/spaceship-vi-mode/actions">
    <img src="https://img.shields.io/github/workflow/status/spaceship-prompt/spaceship-vi-mode/ci?style=flat-square"
      alt="GitHub Workflow Status" />
  </a>

  <a href="https://twitter.com/SpaceshipPrompt">
    <img src="https://img.shields.io/badge/twitter-%40SpaceshipPrompt-00ACEE.svg?style=flat-square"
      alt="Spaceship Twitter" />
  </a>

  <a href="https://discord.gg/NTQWz8Dyt9">
    <img
      src="https://img.shields.io/discord/859409950999707668?label=discord&logoColor=white&style=flat-square"
      alt="Chat on Discord"
    />
  </a>
</p>

This section shows mode indicator only when Vi-mode is enabled.

## Installing

You need to source this plugin somewhere in your dotfiles. Here's how to do it with some popular tools:

### [Oh-My-Zsh]

Execute this command to clone this repo into Oh-My-Zsh plugin's folder:

```zsh
git clone https://github.com/spaceship-prompt/spaceship-vi-mode.git $ZSH_CUSTOM/plugins/spaceship-vi-mode
```

Include `spaceship-vi-mode` in Oh-My-Zsh plugins list:

```zsh
plugins=($plugins spaceship-vi-mode)
```

**Note:** For oh-my-zsh users with vi-mode plugin enabled: Add `export RPS1="%{$reset_color%}"` before `source $ZSH/oh-my-zsh.sh` in `.zshrc` to disable default `<<<` NORMAL mode indicator in right prompt.

### [zplug]

```zsh
zplug "spaceship-prompt/spaceship-vi-mode"
```

### [antigen]

```zsh
antigen bundle spaceship-prompt/spaceship-vi-mode@main
```

### [antibody]

```zsh
antibody bundle "spaceship-prompt/spaceship-vi-mode"
```

### [zinit]

```zsh
zinit light "spaceship-prompt/spaceship-vi-mode"
```

### [zgen]

```zsh
zgen load "spaceship-prompt/spaceship-vi-mode"
```

### [sheldon]

```toml
[plugins.spaceship-section]
github = "spaceship-prompt/spaceship-vi-mode"
```

### Manual

If none of the above methods works for you, you can install Spaceship manually.

1. Clone this repo somewhere, for example to `$HOME/.zsh/spaceship-vi-mode`.
2. Source this section in your `~/.zshrc`.

### Example

```zsh
mkdir -p "$HOME/.zsh"
git clone --depth=1 https://github.com/spaceship-prompt/spaceship-vi-mode.git "$HOME/.zsh/spaceship-vi-mode"
```

For initializing prompt system add this to your `.zshrc`:

```zsh title=".zshrc"
source "~/.zsh/spaceship-vi-mode/spaceship-vi-mode.plugin.zsh"
```

## Usage

After installing, add the following line to your `.zshrc` in order to include Ember section in the prompt:

```zsh
# to include after line break
spaceship add --after line_sep vi_mode

# or
# to include after prompt char
spaceship add --before char vi_mode
```

## Options

| Variable                   |              Default               | Meaning                              |
| :------------------------- | :--------------------------------: | ------------------------------------ |
| `SPACESHIP_VI_MODE_SHOW`   |               `true`               | Show section                         |
| `SPACESHIP_VI_MODE_PREFIX` |                 -                  | Section's prefix                     |
| `SPACESHIP_VI_MODE_SUFFIX` | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Section's suffix                     |
| `SPACESHIP_VI_MODE_INSERT` |               `[I]`                | Text to be shown when in insert mode |
| `SPACESHIP_VI_MODE_NORMAL` |               `[N]`                | Text to be shown when in normal mode |
| `SPACESHIP_VI_MODE_COLOR`  |              `white`               | Sectin's color                       |

## Helpers

You can temporarily enable or disable vi-mode with handy functions (just execute them in terminal as any other regular command):

| Function                    | Meaning                                      |
| :-------------------------- | -------------------------------------------- |
| `spaceship_vi_mode_enable`  | Enable vi-mode for current terminal session  |
| `spaceship_vi_mode_disable` | Disable vi-mode for current terminal session |

**Note:** If the prompt does not refresh when changing modes add `eval spaceship_vi_mode_enable` to your `.zshrc`. Beware that `spaceship_vi_mode_enable` will override the`zle-keymap-select` widget, so if you have a custom one just make sure it contains the line `zle reset-prompt ; zle -R`.

## License

MIT © [Denys Dovhan](http://denysdovhan.com)

<!-- References -->

[Oh-My-Zsh]: https://ohmyz.sh/
[zplug]: https://github.com/zplug/zplug
[antigen]: https://antigen.sharats.me/
[antibody]: https://getantibody.github.io/
[zinit]: https://github.com/zdharma/zinit
[zgen]: https://github.com/tarjoilija/zgen
[sheldon]: https://sheldon.cli.rs/
