#
# vi-mode
#

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_VI_MODE_SHOW="${SPACESHIP_VI_MODE_SHOW=true}"
SPACESHIP_VI_MODE_PREFIX="${SPACESHIP_VI_MODE_PREFIX=""}"
SPACESHIP_VI_MODE_SUFFIX="${SPACESHIP_VI_MODE_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_VI_MODE_INSERT="${SPACESHIP_VI_MODE_INSERT="[I]"}"
SPACESHIP_VI_MODE_NORMAL="${SPACESHIP_VI_MODE_NORMAL="[N]"}"
SPACESHIP_VI_MODE_COLOR="${SPACESHIP_VI_MODE_COLOR="white"}"
SPACESHIP_VI_MODE_INSERT_COLOR="${SPACESHIP_VI_MODE_INSERT_COLOR=${SPACESHIP_VI_MODE_COLOR}}"
SPACESHIP_VI_MODE_NORMAL_COLOR="${SPACESHIP_VI_MODE_NORMAL_COLOR=${SPACESHIP_VI_MODE_COLOR}}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

# Show current vi-mode mode
spaceship_vi_mode() {
  [[ $SPACESHIP_VI_MODE_SHOW == true ]] || return

  if bindkey | grep "vi-quoted-insert" > /dev/null 2>&1; then # check if vi-mode enabled
    local mode_indicator="${SPACESHIP_VI_MODE_INSERT}"
    local mode_indicator_color="${SPACESHIP_VI_MODE_INSERT_COLOR}"

    case "${KEYMAP}" in
      main|viins)
      mode_indicator="${SPACESHIP_VI_MODE_INSERT}"
      mode_indicator_color="${SPACESHIP_VI_MODE_INSERT_COLOR}"
      ;;
      vicmd)
      mode_indicator="${SPACESHIP_VI_MODE_NORMAL}"
      mode_indicator_color="${SPACESHIP_VI_MODE_NORMAL_COLOR}"
      ;;
    esac

    spaceship::section::v3 \
      "$mode_indicator_color" \
      "$SPACESHIP_VI_MODE_PREFIX" \
      "$mode_indicator" \
      "$SPACESHIP_VI_MODE_SUFFIX"
  fi
}

# ------------------------------------------------------------------------------
# Helpers
# ------------------------------------------------------------------------------

# Temporarily switch to vi-mode
spaceship_vi_mode_enable() {
  function zle-keymap-select() { spaceship::core::refresh_section "vi_mode" ; zle .reset-prompt && zle -R }
  zle -N zle-keymap-select
  bindkey -v
}

# Temporarily switch to emacs-mode
spaceship_vi_mode_disable() {
  bindkey -e
}
