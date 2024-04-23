#!/bin/zsh

# Define <CTRL-G ...> keymaps to make fzf-git-tmux work.
# see ~/.zshrc for export of $FZF_GIT_BINDKEYS

tmux bind-key -n -T root C-g send-keys C-g \; switch-client -T ctrl_g_mode

for i in $(echo $FZF_GIT_BINDKEYS); do
    if [[ "$i" =~ "\"\^G([^\"]+)" ]]; then
        local key=${match[1]/\^/C-}
        tmux bind-key -T ctrl_g_mode "$key" send-keys C-g "$key"
    fi
done

return 0;
