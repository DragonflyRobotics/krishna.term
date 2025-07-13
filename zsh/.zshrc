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

# Created by `pipx` on 2025-07-06 21:54:44
export PATH="$PATH:/home/kshah/.local/bin"

# eval "$(/home/kshah/Documents/Github/uv/target/debug/uv envy init zsh)"
