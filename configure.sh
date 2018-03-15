echo "Enter the ip of the seed node:"
read seed

tmux new-session \; split-window -v \; resize-pane -D 22 \; send-keys "scripts/cass_init.sh '$seed'" C-m \;
