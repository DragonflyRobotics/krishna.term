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

. "$HOME/.cargo/env"
