# Start-Tmux.ps1
# Attach to or create the "main" tmux session inside WSL as user kmk2

wsl.exe -u kmk2 tmux new -A -s main
