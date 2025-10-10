## have wsl registered with ubuntu or debian create a new user with a specific tmux conf file
```
PS C:\Users\konos> wsl.exe -u kmk2
Welcome to Ubuntu 22.04.5 LTS (GNU/Linux 6.6.87.2-microsoft-standard-WSL2 x86_64)

kmk2@DESKTOP-CAAO5UV:/mnt/c/Users/konos$ cat ~/.tmux.conf

set -g default-command "cd /mnt/c/Users/konos; exec pwsh.exe --nologo"
set-window-option -g automatic-rename off
bind c new-window -n "PowerShell"


# this part is beautifull for linux compined with kitty terminal , exclude the powershell from above
#$ nano ~/.tmux.conf
#$ tmux source-file ~/.tmux.conf
#$ cat ~/.tmux.conf

#to run tmux with a specific tmux conf file
#$ tmux -f ~/.tmux.conf

########add this
# Enable mouse support this line is gold to navigate in tmux
set -g mouse on

# Use vim-style keys in copy mode
setw -g mode-keys vi

########################
# if you want even change prefix ( ctrl +b ) with ctrl + space


unbind C-b
set -g prefix C-Space
bind C-Space send-prefix
````

PS C:\Users\konos> wsl.exe -u kmk2 tmux new -A -s main



and you have tmux with powershell


_____________

other way to open it 
```
PS C:\Users\konos\tmux> cat .\Start_tmux_windows.ps1
# Start-Tmux.ps1
# Attach to or create the "main" tmux session inside WSL as user kmk2

wsl.exe -u kmk2 tmux new -A -s main
```

###########

To create a **shortcut** that runs your PowerShell script with the specified parameters, follow these steps:

---

### ✅ Step-by-Step: Create a Desktop Shortcut

1. **Right-click** on your desktop (or in any folder) → **New** → **Shortcut**.

2. In the **"Type the location of the item"** field, paste the full command:

   ```cmd
   C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -ExecutionPolicy Bypass -File "C:\Users\konos\tmux\Start_tmux_windows.ps1"
   ```

3. Click **Next**.

4. Give the shortcut a **name**, e.g., `Start tmux`.

5. Click **Finish**.

---
# other notes 

## to create a user on wsl 

### Launch WSL as root
wsl -u root

### Create new user (replace 'kmk2' with your preferred username)
adduser kmk2

### Add to sudo group (optional but recommended)
usermod -aG sudo kmk2

### Exit root shell
exit

## kitty conf for a linux distro not wsl 
```
cat ~/.config/kitty/kitty.conf
scrollback_lines 20000
tab_bar_edge top
font_size 14.0
tab_bar_style powerline
font_family  DejaVu Sans Mono
font_style       Light
```


<img width="1095" height="621" alt="2025-10-11 02_15_03-" src="https://github.com/user-attachments/assets/bd183c94-6c42-4a05-be77-93acb22312e5" />

