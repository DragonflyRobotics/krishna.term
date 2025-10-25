# Created by newuser for 5.8.1

source $HOME/antigen.zsh

# Load the oh-my-zsh's library
antigen use oh-my-zsh

antigen bundles <<EOBUNDLES
    # Bundles from the default repo (robbyrussell's oh-my-zsh)
    git

    # Syntax highlighting bundle.
    zsh-users/zsh-syntax-highlighting

    # Fish-like auto suggestions
    zsh-users/zsh-autosuggestions

    # Extra zsh completions
    zsh-users/zsh-completions

    MichaelAquilina/zsh-you-should-use

    pip

    command-not-found
EOBUNDLES

antigen apply


# Initialize Starship prompt
eval "$(starship init zsh)"

source <(fzf --zsh)
eval "$(zoxide init zsh)"

alias cd="z"
alias cat="bat"
alias ls="eza"

. "$HOME/.cargo/env"

export PATH="$HOME/.local/bin:$PATH"
export PATH="/usr/local/cuda/bin:$PATH"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"


# # Directory where your scripts live
# SCRIPT_DIR="$HOME/.local/scripts"
#
# # Fuzzy search + auto argument insertion
# fuzzy_script() {
#   local selected script_name args_line args_template
#   selected=$(find "$SCRIPT_DIR" -type f -executable | fzf --prompt="Select script: ")
#
#   [[ -z "$selected" ]] && return 1
#
#   # Parse argument template from comment like: # @args: input output
#   args_line=$(grep -m1 '^# @args:' "$selected" | cut -d':' -f2- | xargs)
#   script_name=$(basename "$selected")
#
#   # Insert into command line buffer
#   if [[ -n "$args_line" ]]; then
#     print -z "$selected $args_line"
#   else
#     print -z "$selected"
#   fi
# }
#
# # Bind to shortcut (Ctrl+S)
# bindkey -s '^S' 'fuzzy_script\n'
#
#

SCRIPT_DIR="$HOME/.local/scripts"

fuzzy_script_widget() {
  local selected args_line cmd first_arg_pos
  selected=$(find "$SCRIPT_DIR" -type f -executable | fzf --prompt="Select script: " --preview 'head -n 10 {}')

  [[ -z "$selected" ]] && return 1

  # Parse argument template
  args_line=$(grep -m1 '^# @args:' "$selected" | cut -d':' -f2- | xargs)

  # Build the command string
  if [[ -n "$args_line" ]]; then
    cmd="$selected $args_line"
  else
    cmd="$selected"
  fi

  # Insert into command line buffer
  BUFFER="$cmd"

  # Move cursor to start of first argument (after the script path)
  if [[ -n "$args_line" ]]; then
    first_arg_pos=$(( ${#selected} + 1 ))
    CURSOR=$first_arg_pos
  else
    CURSOR=${#BUFFER}
  fi

  zle redisplay
}

# Register the widget with ZLE
zle -N fuzzy_script_widget

# Bind Ctrl+S to it
bindkey '^S' fuzzy_script_widget

