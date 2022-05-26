#!/usr/bin/env zsh

# Required for shunit2 to run correctly
CWD="${${(%):-%x}:A:h}"
setopt shwordsplit
SHUNIT_PARENT=$0

# Use system Spaceship or fallback to Spaceship Docker on CI
typeset -g SPACESHIP_ROOT="${SPACESHIP_ROOT:=/spaceship}"

# Mocked tool CLI
mocked_version="v1.0.0-mocked"
tool() {
  echo "$mocked_version"
}

# ------------------------------------------------------------------------------
# SHUNIT2 HOOKS
# ------------------------------------------------------------------------------

setUp() {
  # Enter the test directory
  cd $SHUNIT_TMPDIR

  bindkey() {
    echo "vi-quoted-insert"
  }
}

oneTimeSetUp() {
  export TERM="xterm-256color"

  source "$SPACESHIP_ROOT/spaceship.zsh"
  source "$(dirname $CWD)/spaceship-vi-mode.plugin.zsh"

  SPACESHIP_PROMPT_ASYNC=false
  SPACESHIP_PROMPT_FIRST_PREFIX_SHOW=true
  SPACESHIP_PROMPT_ADD_NEWLINE=false
  SPACESHIP_PROMPT_ORDER=(vi_mode)

  echo "Spaceship version: $(spaceship --version)"
}

oneTimeTearDown() {
  unset SPACESHIP_PROMPT_ASYNC
  unset SPACESHIP_PROMPT_FIRST_PREFIX_SHOW
  unset SPACESHIP_PROMPT_ADD_NEWLINE
  unset SPACESHIP_PROMPT_ORDER
}

# ------------------------------------------------------------------------------
# TEST CASES
# ------------------------------------------------------------------------------

test_defined() {
  assertTrue 'should define spaceship_vi_mode' "spaceship::exists spaceship_vi_mode"
  assertTrue 'should define spaceship_vi_mode_enable' "spaceship::exists spaceship_vi_mode_enable"
  assertTrue 'should define spaceship_vi_mode_disable' "spaceship::exists spaceship_vi_mode_disable"
}

test_insert_mode() {
  local prefix=""
  local content="%{%B%F{$SPACESHIP_VI_MODE_COLOR}%}$SPACESHIP_VI_MODE_INSERT%{%b%f%}"
  local suffix="%{%B%}$SPACESHIP_VI_MODE_SUFFIX%{%b%}"
  local expected="$prefix$content$suffix"

  export KEYMAP="main"
  local actual_main="$(spaceship::testkit::render_prompt)"

  assertEquals "should render insert mode when main" "$actual_main" "$expected"

  export KEYMAP="viins"
  local actual_viins="$(spaceship::testkit::render_prompt)"

  assertEquals "should render insert mode when viins" "$actual_viins" "$expected"
}

test_normal_mode() {
  local prefix=""
  local content="%{%B%F{$SPACESHIP_VI_MODE_COLOR}%}$SPACESHIP_VI_MODE_NORMAL%{%b%f%}"
  local suffix="%{%B%}$SPACESHIP_VI_MODE_SUFFIX%{%b%}"
  local expected="$prefix$content$suffix"

  export KEYMAP="vicmd"
  local actual_vicmd="$(spaceship::testkit::render_prompt)"

  assertEquals "should render normal mode when vicmd" "$actual_vicmd" "$expected"
}

# ------------------------------------------------------------------------------
# SHUNIT2
# Run tests with shunit2
# ------------------------------------------------------------------------------

source "$SPACESHIP_ROOT/tests/shunit2/shunit2"
