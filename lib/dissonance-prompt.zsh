## Dissonance Zsh Theme
## 
## Created By: Ryan Scott Lewis <ryanscottlewis@gmail.com>
## License: MIT
## Version: 0.0.2

# -= Palette =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= #

# -- ANSI ---------------------------------------------------------------------------------------- #
# Set terminal ANSI colors to Dissonance theme colors for best results:
# https://github.com/RyanScottLewis/theme-dissonance-colors

THEME_PALETTE_BLACK=000
THEME_PALETTE_BLACK_BRIGHT=008
THEME_PALETTE_RED=001
THEME_PALETTE_RED_BRIGHT=009
THEME_PALETTE_GREEN=002
THEME_PALETTE_GREEN_BRIGHT=010
THEME_PALETTE_YELLOW=003
THEME_PALETTE_YELLOW_BRIGHT=011
THEME_PALETTE_BLUE=004
THEME_PALETTE_BLUE_BRIGHT=012
THEME_PALETTE_MAGENTA=005
THEME_PALETTE_MAGENTA_BRIGHT=013
THEME_PALETTE_CYAN=006
THEME_PALETTE_CYAN_BRIGHT=014
THEME_PALETTE_WHITE=007
THEME_PALETTE_WHITE_BRIGHT=015

# -= Colors =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- #

THEME_COLOR_USER_NORMAL=$THEME_PALETTE_CYAN
THEME_COLOR_USER_ROOT=$THEME_PALETTE_RED
THEME_COLOR_HOST=$THEME_PALETTE_CYAN
THEME_COLOR_PATH=$THEME_PALETTE_GREEN
THEME_COLOR_DATE=$THEME_PALETTE_YELLOW
THEME_COLOR_TIME=$THEME_PALETTE_YELLOW
THEME_COLOR_SIGIL_SUCCESS=$THEME_PALETTE_GREEN_BRIGHT
THEME_COLOR_SIGIL_ERROR=$THEME_PALETTE_RED
THEME_COLOR_SIGIL=$THEME_COLOR_SIGIL_VALID # The inital and current sigil color
THEME_COLOR_KEYMAP=$THEME_PALETTE_YELLOW_BRIGHT
THEME_COLOR_KEYMAP_EMACS=$THEME_COLOR_KEYMAP
THEME_COLOR_KEYMAP_VI=$THEME_COLOR_KEYMAP
THEME_COLOR_KEYMAP_VI_COMMAND=$THEME_COLOR_KEYMAP_VI
THEME_COLOR_KEYMAP_VI_INSERT=$THEME_COLOR_KEYMAP_VI
THEME_COLOR_KEYMAP_VI_OPERATOR_PENDING=$THEME_COLOR_KEYMAP_VI
THEME_COLOR_KEYMAP_VI_VISUAL=$THEME_COLOR_KEYMAP_VI
THEME_COLOR_KEYMAP_PROMPT_VI_COMMAND_BACKGROUND=$THEME_PALETTE_BLUE_BRIGHT
THEME_COLOR_KEYMAP_PROMPT_VI_COMMAND_FOREGROUND=$THEME_PALETTE_BLACK
THEME_COLOR_KEYMAP_ISEARCH=$THEME_COLOR_KEYMAP
THEME_COLOR_KEYMAP_COMMAND=$THEME_COLOR_KEYMAP
THEME_COLOR_SESSION=$THEME_PALETTE_MAGENTA_BRIGHT
THEME_COLOR_SHELL_LEVEL=$THEME_PALETTE_MAGENTA
THEME_COLOR_GIT_BRANCH=$THEME_PALETTE_CYAN_BRIGHT
THEME_COLOR_RVM=$THEME_PALETTE_RED
THEME_COLOR_JOBS=$THEME_PALETTE_GREEN_BRIGHT

# -= Sigil =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= #
# Sigil will be randomply selected from the THEME_SIGILS list.
# Sigils are any braile pattern which is 4 dots high with a dot in the first or last row.

export THEME_SIGILS="⣽⣼⣻⣺⣹⣸⣷⣵⣳⣱⣯⣮⣭⣬⣫⣪⣩⣨⣧⣥⣣⣡⣟⣞⣝⣜⣛⣚⣙⣘⣗⣕⣓⣑⣏⣇⣈⣉⣊⣋⣌⣍⣎⣅⣃⣁⢿⢾⢽⢼⢻⢺⢹⢸⢷⢵⢳⢱⢯⢮⢭⢬⢫⢪⢩⢨⢧⢥⢣⢡⢟⢞⢝⢜⢛⢚⢙⢘⢗⢕⢓⢑⢏⢎⢍⢌⢋⢊⢉⢈⢇⢅⢃⡿⡾⡽⡼⡻⡺⡹⡸⡷⡵⡳⡱⡯⡮⡭⡬⡫⡪⡩⡨⡧⡥⡣⡡⡟⡞⡝⡜⡛⡚⡙⡘⡗⡕⡓⡑⡏⡎⡍⡌⡋⡊⡉⡈⡇⡅⡃⡁"
THEME_SIGIL=$(ruby -e "print ENV['THEME_SIGILS'].chars.sample")

# -= Components =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- #

# -- Sigil --------------------------------------------------------------------------------------- #

function theme_prompt_sigil() {
  echo -n "%{%0(?.$FG[$THEME_COLOR_SIGIL_SUCCESS].$FG[$THEME_COLOR_SIGIL_ERROR])%}"
  echo -n $THEME_SIGIL
  echo -n "%{$reset_color%}"
}

# -- User ---------------------------------------------------------------------------------------- #
# Can have an optional argument which is the levels of paths from cwd to show.
# Negative numbers will show from root.

function theme_prompt_user() {
  echo -n "%{%0(#.$FG[$THEME_COLOR_USER_ROOT].$FG[$THEME_COLOR_USER_NORMAL])%}"
  echo -n "%n"
  echo -n "%{$reset_color%}"
}

# -- Host ---------------------------------------------------------------------------------------- #

function theme_prompt_host() {
  echo -n "%{$FG[$THEME_COLOR_HOST]%}"
  echo -n "%m" # TODO: Default to %M but use %m if argument is given and > 0 for use with states
  echo -n "%{$reset_color%}"
}

# -- Path ---------------------------------------------------------------------------------------- #

function theme_prompt_path() {
  echo -n "%{$FG[$THEME_COLOR_PATH]%}"
  echo -n "%$1~"
  echo -n "%{$reset_color%}"
}

# -- Date ---------------------------------------------------------------------------------------- #

function theme_prompt_date() {
  echo -n "%{$FG[$THEME_COLOR_DATE]%}"
  echo -n "%D"
  echo -n "%{$reset_color%}"
}

# -- Time ---------------------------------------------------------------------------------------- #

function theme_prompt_time() {
  echo -n "%{$FG[$THEME_COLOR_TIME]%}"
  echo -n "%D{%r}"
  echo -n "%{$reset_color%}"
}

# -- Keymap -------------------------------------------------------------------------------------- #

THEME_PROMPT_KEYMAP_EMACS="Emacs"
THEME_PROMPT_KEYMAP_VI_INSERT="Vi Insert"
THEME_PROMPT_KEYMAP_VI_COMMAND="Vi Command"
THEME_PROMPT_KEYMAP_VI_OPERATOR_PENDING="Vi Pending"
THEME_PROMPT_KEYMAP_VI_VISUAL="Vi Visual"
THEME_PROMPT_KEYMAP_ISEARCH="Search"
THEME_PROMPT_KEYMAP_COMMAND="Command"
THEME_PROMPT_KEYMAP_MAIN=$THEME_PROMPT_KEYMAP_VI_INSERT # Set the default here
THEME_PROMPT_KEYMAP_CURRENT=$THEME_PROMPT_KEYMAP_MAIN

function theme_prompt_keymap() {
  echo -n " "
  echo -n "%{$FG[$THEME_COLOR_KEYMAP]%}" # TODO: THEME_COLOR_KEYMAP_* colors
  echo -n $THEME_PROMPT_KEYMAP_CURRENT
  echo -n "%{$reset_color%}"
}

# -- Session ------------------------------------------------------------------------------------- #
# TODO: THEME_COLOR_SESSION_SSH, etc..

THEME_PROMPT_SESSION_SSH="ssh"
THEME_PROMPT_SESSION_SCREEN="screen"
THEME_PROMPT_SESSION_TMUX="tmux"
THEME_PROMPT_SESSION_SHELL="zsh"

function theme_prompt_session() {
  echo -n " "
  echo -n "%{$FG[$THEME_COLOR_SESSION]%}"

  if [[ -n $SSH_CLIENT || -n $SSH_TTY ]]; then
    echo -n $THEME_PROMPT_SESSION_SSH
  elif [[ -n $STY ]]; then
    echo -n $THEME_PROMPT_SESSION_SCREEN
  elif [[ -n $TMUX ]]; then
    echo -n $THEME_PROMPT_SESSION_TMUX
  else
    echo -n $THEME_PROMPT_SESSION_SHELL
  fi

  echo -n "%{$reset_color%}"
}

# -- Shell Level --------------------------------------------------------------------------------- #

function theme_prompt_shell_level() {
  echo -n " "
  echo -n "%{$FG[$THEME_COLOR_SHELL_LEVEL]%}"
  echo -n "%L"
  echo -n "%{$reset_color%}"
}

# -- Git ----------------------------------------------------------------------------------------- #

function theme_prompt_git_branch() {
  local branch=$(git_current_branch)

  if [ -n "$branch" ]; then
    echo -n " "
    echo -n "%{$FG[$THEME_COLOR_GIT_BRANCH]%}"
    echo -n $branch
    echo -n "%{$reset_color%}"
  fi
}

# -- RVM ----------------------------------------------------------------------------------------- #
# See: https://rvm.io/workflow/prompt

function theme_prompt_rvm() {
  echo -n " "
  echo -n "%{$FG[$THEME_COLOR_RVM]%}"
  echo -n "${$($HOME/.rvm/bin/rvm-prompt 2>/dev/null)/ruby-/}" # Converts things like jruby-0.1.2 to j 0.1.2
  echo -n "%{$reset_color%}"
}

# -- Jobs ---------------------------------------------------------------------------------------- #

function theme_prompt_jobs() {
  echo -n " "
  echo -n "%{$FG[$THEME_COLOR_JOBS]%}"
  echo -n "%1(j.$ZSH_THEME_JOBS_PREFIX%j job%2(j.s.).)"
  echo -n "%{$reset_color%}"
}

# -= States =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- #
# Set a custom state in the `theme_update_status` function and set it to either the
# `THEME_STATE_MAIN` or `THEME_STATE_ALTERNATE` variables.

THEME_STATE_MAIN="full"
THEME_STATE_ALTERNATE="compact"
THEME_STATE_CURRENT=$THEME_STATE_MAIN

# The list of available theme states
# First value is the name and the second value is an Array
# The first value in the Array is the left prompt and the second is the right
typeset -A THEME_STATE_PROMPT_LEFT
typeset -A THEME_STATE_PROMPT_RIGHT

# Refresh the prompt states
function theme_update_state() {

  # -- Full State
  THEME_STATE_PROMPT_LEFT[full]="$(theme_prompt_user)@$(theme_prompt_host):$(theme_prompt_path 3) $(theme_prompt_date) $(theme_prompt_time) $(theme_prompt_sigil) "
  THEME_STATE_PROMPT_RIGHT[full]="$(theme_prompt_keymap)$(theme_prompt_session)$(theme_prompt_shell_level)$(theme_prompt_git_branch)$(theme_prompt_rvm)$(theme_prompt_jobs)"

  if [ $THEME_PROMPT_KEYMAP_CURRENT = $THEME_PROMPT_KEYMAP_VI_COMMAND ]; then
    THEME_STATE_PROMPT_LEFT[full]="$THEME_STATE_PROMPT_LEFT[full]%K{$THEME_COLOR_KEYMAP_PROMPT_VI_COMMAND_BACKGROUND}%F{$THEME_COLOR_KEYMAP_PROMPT_VI_COMMAND_FOREGROUND}"
    THEME_STATE_PROMPT_RIGHT[full]="%f%k$THEME_STATE_PROMPT_RIGHT[full]%E"
  fi

  # -- Compact State
  THEME_STATE_PROMPT_LEFT[compact]="$(theme_prompt_user) $(theme_prompt_path 1) $(theme_prompt_sigil) "
  THEME_STATE_PROMPT_RIGHT[compact]="$(theme_prompt_keymap)$(theme_prompt_git_branch)$(theme_prompt_jobs)"
}

# Toggle the theme's current state between main and alternate
# # TODO Pass argument
function theme_toggle_state() {
  if [ $THEME_STATE_CURRENT = $THEME_STATE_MAIN ]; then
    THEME_STATE_CURRENT=$THEME_STATE_ALTERNATE
  else
    THEME_STATE_CURRENT=$THEME_STATE_MAIN
  fi

  theme_update
  zle && { zle reset-prompt; zle -R }
}

zle -N theme_toggle_state

bindkey "\e[17~" theme_toggle_state          # [F6] Main ------- Toggle theme state between main and alternate
bindkey -M vicmd "\e[17~" theme_toggle_state # [F6] Vi Command - Toggle theme state between main and alternate

# -= Prompt =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- #

function theme_update_prompt() {
  PROMPT=$THEME_STATE_PROMPT_LEFT[$THEME_STATE_CURRENT]
  RPS1=$THEME_STATE_PROMPT_RIGHT[$THEME_STATE_CURRENT]
}

# -= Theme =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= #

function theme_update() {
  theme_update_state
  theme_update_prompt
}

# -- Setup --------------------------------------------------------------------------------------- #
# See: http://stackoverflow.com/questions/2187829/constantly-updated-clock-in-zsh-promp

function zle-line-init zle-keymap-select {
  case $KEYMAP in
    "emacs")
      THEME_PROMPT_KEYMAP_CURRENT=$THEME_PROMPT_KEYMAP_EMACS;;
    "viins")
      THEME_PROMPT_KEYMAP_CURRENT=$THEME_PROMPT_KEYMAP_VI_INSERT;;
    "vicmd")
      THEME_PROMPT_KEYMAP_CURRENT=$THEME_PROMPT_KEYMAP_VI_COMMAND;;
    "viopp")
      THEME_PROMPT_KEYMAP_CURRENT=$THEME_PROMPT_KEYMAP_VI_OPERATOR_PENDING;;
    "visual")
      THEME_PROMPT_KEYMAP_CURRENT=$THEME_PROMPT_KEYMAP_VI_VISUAL;;
    "isearch")
      THEME_PROMPT_KEYMAP_CURRENT=$THEME_PROMPT_KEYMAP_ISEARCH;;
    "command")
      THEME_PROMPT_KEYMAP_CURRENT=$THEME_PROMPT_KEYMAP_COMMAND;;
    *)
      THEME_PROMPT_KEYMAP_CURRENT=$THEME_PROMPT_KEYMAP_MAIN;;
  esac

  theme_update
  zle && { zle reset-prompt; zle -R }
}

zle -N zle-line-init
zle -N zle-keymap-select

# TODO: This is screwy
# TMOUT=1
#
# # Runs TRAPALRM every $TMOUT seconds
# TRAPALRM() {
#   theme_update
#
#   # If any menu widgets are open, do not reset the prompt which wipes the menu items
#   if ! [[ $WIDGET =~ ".*(complete-|menu-|list-|expand-or-complete).*" ]]; then
#     zle && { zle reset-prompt; zle -R }
#   fi
# }

# Ensure that the prompt is redrawn when the terminal size changes.
TRAPWINCH() {
  zle && { zle reset-prompt; zle -R }
}

# -- Begin --------------------------------------------------------------------------------------- #

theme_update
