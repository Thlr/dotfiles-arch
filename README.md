### Software used
manjaro + i3-gaps

polybar

terminal : kitty + zsh shell + powerlevel10k prompt

kawase blur thanks to compton-tryone-git

dmenu : rofi

polybar + vim + kitty + rofi themes automatically generated with wpgtk based on the wallpaper

notifications with dunstify
Additionnal icon pack required : https://github.com/snwh/faba-icon-theme

### Other config
Touchpad configuration :

```
# /etc/X11/xorg.conf.d/90-touchpad.conf
Section "InputClass"
         Identifier "touchpad"
           MatchIsTouchpad "on"
           Driver "libinput"
           Option "Tapping" "on"
           Option "TappingButtonMap" "lrm"
           Option "NaturalScrolling" "on"
           Option "ScrollMethod" "twofinger"
EndSection
```


### Troubleshooting

* enable native chrome notifications (with chromium 78+) :
https://support.google.com/chrome/thread/18102285?hl=en


