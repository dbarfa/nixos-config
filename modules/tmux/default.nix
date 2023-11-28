{...}: {
  programs.tmux = {
    enable = true;
    extraConfig = ''
#set -g default-terminal "screen-256color"
#set -ga terminal-overrides ",*256col*:Tc"
#set -ga terminal-overrides ',screen-256color:Tc'
set-option -sa terminal-features ',tmux-256color:RGB'
set-option -g default-terminal "screen-256color"
set-option -sa terminal-features ',screen-256color:RGB'
#set -sg default-terminal tmux-256color
#set -asg terminal-features ",tmux-256color:256:RGB:mouse:cstyle"
# this should help with esc in nvim
set -s escape-time 0

setw -g mouse on

# remap C-b to C-a for ease of use
unbind C-b
set-option -g prefix C-a
bind-key C-a send-prefix


# vim-like pane switching
bind -r ^ last-window
bind -r k select-pane -U
bind -r j select-pane -D
bind -r h select-pane -L
bind -r l select-pane -R


#set -g status-style 'bg=#333333 fg=#5eacd3'

set -g status-bg black  
set -g status-fg gray
set -g pane-active-border-style fg=blue
set -g pane-border-style fg=default
set -g message-style bg=black,fg=white
set -g status-interval 1
# window status

set -g status-left ""
#set -g status-left '#[bg=gray]#[fg=#282a36]#{?client_prefix,#[bg=blue],} #S '
#set -ga status-left '#[bg=black]#[fg=gray] #{?window_zoomed_flag, ↕  ,  }'


#status middle
set -g status-left " "
set -g window-status-current-format "#[fg=#282a36]#[bg=gray]#{?client_prefix,#[bg=blue],} #I #W "
set -g window-status-format "#[fg=gray] #I #W "
# status right
set -g status-right ""

set -g status-justify left

# indexing starts from 1
set -g base-index 1
setw -g pane-base-index 1

    '';
  };
}
