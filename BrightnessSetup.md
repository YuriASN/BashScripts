The script of Brightness works fine, but you also need to bind it to a shortcut in order to make it efficient.
On the tutorial bellow, you will learn how to see customs and default binds and change them.

# Default Key-Binds
## Reading the key code

First we need to figure out the code of your key.
For that, run the command `xev | grep keysym` and press the key you intend to use.
Keep in mind that a single press can show more than one click on your terminal.
The paramater after the comma inside of the parenthesis is what you're looking for.

## Removing Default key-binds

Most of the time you won't be needing to do that, but if you have problem with command
override, it might be a good idea to remove the default.  
Use the command `xev | grep KEYCODE` changing KEYCODE with the code you discovered [before](#reading-the-key-code).
That will give you the command that the key is binded to.  
Ex.: `org.gnome.settings-daemon.plugins.media-keys screen-brightness-up-static ['XF86MonBrightnessUp']`.
To unbind the key use the command `gsettings set` with the description of the command followed by `"[]"`.  
Ex.: `gsettings set org.gnome.settings-daemon.plugins.media-keys screen-brightness-up-static "[]"`.

## Re-attributing Default Binds

The process is the same as [removing](#removing-default-key-binds), all you should do is change from `"[]"` to `"['KEYCODE']"`.  
To find what to re-attribute, find what's missing with `xev | grep @as []`


# Custom Key-Binds

## Looking For Existing Custom-Binds

To see if you already have any custom key-binds with:  
`gsettings get org.gnome.settings-daemon.plugins.media-keys custom-keybindings`  
It'll display all your binds separated by comma, if nothing is found `@as []`.

## Reading existing custom key-binds values

If you want to read the content of a key-bind, run
`gsettings list-recursively org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/`, customN is accordingly to what you want to read.
You will be given 3 values:  
***binding*** as the key binded.  
***command*** as what it does.  
***name*** as the name of the bind.  
To create or change a bind, you'll be operating with the same values.

## Creating custom key-binds

### Creating the key-bind
Add your custom following the numbers already there adding it to the
old binds separated by comma. Create as custom0, custom1 and so on.  
Ex.:`gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/']"`  
Ex. of adding one beyond custom0: `gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/','/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/']"`.  
Notice that on this case, although custom0 already existed, I wrote it again. You can just get the result from 

### Attributing The Values

**Command to be executed:**  
`gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ command "INSERT YOUR COMMAND HERE"`

**Name your command:**  
`gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ name "NAME OF COMMAND"`

**Attribute your key:**  
`gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ binding "KEYCODE"`

## Removing custom key-binds

To remove a bind, you just have to update the list of binds excluding it.  
For example, if you have custom0, custom1, custom2, and want to remove custom1, run:  
`gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/']"`