<h1 align="center">
  😍 + 🚀
  <br>Spaceship Section<br>
</h1>

<h4 align="center">
  A <a href="https://template.com" target="_blank">Tool</a> section for Spaceship prompt
</h4>

<p align="center">
  <a href="https://github.com/spaceship-prompt/spaceship-section/releases">
    <img src="https://img.shields.io/github/v/release/spaceship-prompt/spaceship-section.svg?style=flat-square"
      alt="GitHub Release" />
  </a>

  <a href="https://github.com/spaceship-prompt/spaceship-section/actions">
    <img src="https://img.shields.io/github/workflow/status/spaceship-prompt/spaceship-section/ci?style=flat-square"
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

Current Tool version, through tool (`😍`).

## Installing

You need to source this plugin somewhere in your dotfiles. Here's how to do it with some popular tools:

### [Oh-My-Zsh]

Execute this command to clone this repo into Oh-My-Zsh plugin's folder:

```zsh
git clone https://github.com/spaceship-prompt/spaceship-section.git $ZSH_CUSTOM/plugins/spaceship-section
```

Include `spaceship-section` in Oh-My-Zsh plugins list:

```zsh
plugins=($plugins spaceship-section)
```

### [zplug]

```zsh
zplug "spaceship-prompt/spaceship-section"
```

### [antigen]

```zsh
antigen bundle "spaceship-prompt/spaceship-section"
```

### [antibody]

```zsh
antibody bundle "spaceship-prompt/spaceship-section"
```

### [zinit]

```zsh
zinit light "spaceship-prompt/spaceship-section"
```

### [zgen]

```zsh
zgen load "spaceship-prompt/spaceship-section"
```

### [sheldon]

```toml
[plugins.spaceship-section]
github = "spaceship-prompt/spaceship-section"
```

## Usage

After installing, add the following line to your `.zshrc` in order to include Ember section in the prompt:

```zsh
spaceship add section
```

## Options

This section is shown only in directories containing a `file-to-check.ext` file.

| Variable                   |              Default               | Meaning                              |
| :------------------------- | :--------------------------------: | ------------------------------------ |
| `SPACESHIP_SECTION_SHOW`   |               `true`               | Show current section                 |
| `SPACESHIP_SECTION_PREFIX` | `$SPACESHIP_PROMPT_DEFAULT_PREFIX` | Prefix before section                |
| `SPACESHIP_SECTION_SUFFIX` | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Suffix after section                 |
| `SPACESHIP_SECTION_SYMBOL` |               `😍·`                | Character to be shown before version |
| `SPACESHIP_SECTION_COLOR`  |             `yellow`               | Color of section                     |

## License

MIT © [Name Surname](http://yourwebsite.com)

<!-- References -->

[Oh-My-Zsh]: https://ohmyz.sh/
[zplug]: https://github.com/zplug/zplug
[antigen]: https://antigen.sharats.me/
[antibody]: https://getantibody.github.io/
[zinit]: https://github.com/zdharma/zinit
[zgen]: https://github.com/tarjoilija/zgen
[sheldon]: https://sheldon.cli.rs/
