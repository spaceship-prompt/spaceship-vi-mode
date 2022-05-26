#
# Tool
#
# A short but clear description of the tool this section is built for.
# Link: https://tool.com/

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_SECTION_SHOW="${SPACESHIP_SECTION_SHOW=true}"
SPACESHIP_SECTION_ASYNC="${SPACESHIP_SECTION_ASYNC=true}"
SPACESHIP_SECTION_PREFIX="${SPACESHIP_SECTION_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
SPACESHIP_SECTION_SUFFIX="${SPACESHIP_SECTION_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_SECTION_SYMBOL="${SPACESHIP_SECTION_SYMBOL="😍 "}"
SPACESHIP_SECTION_COLOR="${SPACESHIP_SECTION_COLOR="yellow"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

# Show current version of the tool.
spaceship_section() {
  [[ $SPACESHIP_SECTION_SHOW == false ]] && return

  # Show only if file-to-check is present
  [[ -f file-to-check.ext ]] || return

  # Extract tool version
  local tool_version="$(tool --version)"

  # Check if tool version is correct
  [[ $tool_version == "system" ]] && return

  # Render tool section
  spaceship::section \
    "$SPACESHIP_SECTION_COLOR" \
    "$SPACESHIP_SECTION_PREFIX" \
    "${SPACESHIP_SECTION_SYMBOL}${tool_version}" \
    "$SPACESHIP_SECTION_SUFFIX"
}
