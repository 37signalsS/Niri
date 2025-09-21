# Add global env
# set -Ux GOOGLE_CLOUD_PROJECT "_"

if status is-interactive

set -g fish_greeting

alias n='nvim'

alias nv='sudo -Es nvim'

alias cd='z'

alias lg='lazygit'

alias rm='trash'

alias vpnon='sudo systemctl start tailscaled && sleep 3 && sudo tailscale up'

alias vpnoff='sudo systemctl stop tailscaled && sleep 3 && sudo tailscale down'

alias l='eza --tree --icons=always --long --git -a'

alias s='sudo systemctl start powertop-nousb.service && niri -c /home/q/notebook1/niri/config.kdl'

alias niri-session='sudo systemctl start powertop-usb.service && niri-session'

alias d="sudo -v; cd (sudo find / -type d 2>/dev/null | fzf --preview 'tree -C {}' --preview-window=right:50%)"

alias codium='/usr/bin/codium --enable-features=UseOzonePlatform,WaylandWindowDecorations --ozone-platform=wayland $argv'

zoxide init fish | source

thefuck --alias | source

starship init fish | source

atuin init fish | source

# Custom binding for atuin up-arrow in ghostty
bind up _atuin_bind_up

end

set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

set PATH $PATH /home/q/.local/bin
set PATH $PATH /home/q/.cargo/bin
