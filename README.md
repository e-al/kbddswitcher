# kbddswitcher
Keyboard layout switcher using kbdd DBus signals

kbddswitcher offers a simple way of indicating current keyboard layout. It requires kbdd package
and communicates with it through DBus signals. kbdd can provide with textbox as well as widget
to indicate current layout.

Using:
1. Place kbdd.lua into ~/.config/awesome/ directory or whatever directory you use for your rc.lua config.
2. Place flag images to /usr/share/icons/kbdd (mkdir if necessary).
3. Add following lines to your rc.lua:

  local kbdd = require("kbdd")
  -- Text indicator
  mylayouttextbox = kbdd.kbdtextbox()
  -- Icon indicator
  mylayouticon = kbdd.kbdwidget()
  
And then put one of them (or both, if you are paranoid) into one of your wiboxes (or layouts in them).

Don't forget to start kbdd daemon.
