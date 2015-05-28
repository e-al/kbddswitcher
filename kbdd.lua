local wibox = require("wibox")

-- Text representation 
local kbdtextbox = wibox.widget.textbox()
-- Graphic representation
local kbdwidget = wibox.widget.imagebox()

local kbdd = {}

-- Default image path
local image_path = "/usr/share/icons/kbdd/"
local layouts = { [0] = "US", [1] = "RU" }
local icons = {}

kbdd.set_icon_dir = function(icon_path)
    icons = { [0] = icon_path .. "us.png", [1] = icon_path .. "ru.png"  }
end

kbdd.set_icon_dir(image_path)

dbus.request_name("session", "ru.gentoo.kbdd")
dbus.add_match("session",
    "interface='ru.gentoo.kbdd',member='layoutChanged'")

dbus.connect_signal("ru.gentoo.kbdd", function(...)
    local data = {...}
    local layout = data[2]
    kbdtextbox:set_markup(layouts[layout])
    kbdwidget:set_image(icons[layout])
end)

kbdd.kbdtextbox = function()
    return kbdtextbox
end

kbdd.kbdwidget = function ()
    return kbdwidget
end 


-- Set US layout as a default
kbdtextbox:set_markup(layouts[0])
kbdwidget:set_image(icons[0])

return kbdd
