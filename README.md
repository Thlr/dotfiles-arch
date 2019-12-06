Welcome to my dotfiles repo

Configuration : Manjaro with i3-gaps

list of installed packages in packages.list
```pacman -Qqe | grep -Fvx "$(pacman -Qqm)" > packages.list``` to save the current packages configuration
```xargs pacman -S --needed --noconfirm < packages.list``` to install all packages.
