from libqtile import widget
from libqtile.lazy import lazy
from settings.variables import colors
from libqtile import qtile


##### DEFAULT WIDGET SETTINGS #####
widget_defaults = dict(
    font="Fira Code",
    fontsize = 11.8,
    padding = 1,
    background=colors["panel"],
    foreground=colors["font"]
)

extension_defaults = widget_defaults.copy()

##### WIDGET CONFIG #####

base = lambda fg, bg : {
        'foreground': fg,
        'background': bg
        }

icon = lambda fontsize = 12, text="?", padding=0: widget.TextBox(
            fontsize=fontsize,
            text=text + " ",
            padding=padding, 
        )

line_separator = lambda : widget.Sep( linewidth = 1, padding = 15 )

space_separator = lambda padding = 12 : widget.Sep(linewidth = 0, padding = padding)

battery_widget = widget.Battery(
            charge_char = " ",
            discharge_char = "",
            empty_char = "",
            full_char = "",
            low_foreground = colors["windowname"],
            notify_below = 0.15,
            format = '{char} {percent:2.0%}', 
            update_interval = 1,
        )

hour_clock = widget.Clock( format = " %H:%M" )

date_clock = widget.Clock( format = " %d-%m-%Y   %H:%M")


volume_widget =  [
        icon(12,""),
        widget.Volume()
    ]

thermal_widget = [
        icon(12, ""),
        widget.ThermalSensor(
            font="Fira Code",
            fontsize = 12,
            padding = 1,
            background=colors["panel"],
            foreground=colors["font"]
        )
    ]

def open_xmenu(): 
    qtile.cmd_spawn("/home/anyiel/.config/xmenu/xmenu.sh")


bar_menu = [
        widget.Sep(
                linewidth = 0,
                padding = 6,
                ),
        widget.Image(
            filename = "/home/anyiel/.config/qtile/icons/bar_icon.svg",
            mouse_callbacks = {'Button1': open_xmenu },
            margin = 4
            ),
        widget.Sep(
                linewidth = 0,
                padding = 0,
                ),
    ]

workspaces = widget.GroupBox(
                        font = "FiraMono",
                        fontsize = 8,
                        margin_y = 2.7,
                        margin_x = 0,
                        padding_y = 5,
                        padding_x = 6,
                        borderwidth = 3,
                        rounded = True,
                        highlight_method = "text",
                        active = colors["font"],
                        inactive = colors["non_active_window"],
                        highlight_color = colors["current_screen_tab"],
                        this_current_screen_border = colors["current_tab_border"],
                        this_screen_border = colors["current_tab_border"],
                        other_current_screen_border = colors["selected_group_offscreen"],
                        other_screen_border = colors["selected_group_offscreen"],
                        urgent_alert_method = "text",
                        urgent_text = colors["alert"],
                        foreground = colors["font"],
                        background = colors["panel"],
                        )

##### BAR WIDGET CONFIG #####

main_widgets = [

    # LEFT 
    *bar_menu,
    widget.CurrentLayoutIcon( scale = 0.5 ),
    space_separator(5), 
    widget.WidgetBox(widgets=[
        widget.Systray(padding=6, icon_size=20),
    ], text_closed = "", text_open = "", fontsize=11),

    widget.Spacer(),

    # MIDDLE
    workspaces, 

    widget.Spacer(),

    # RIGHT
    icon(text=""),
    widget.Memory(),
    space_separator(), 

    battery_widget,
    space_separator(), 

    *volume_widget,
    space_separator(), 

    date_clock,
    space_separator(), 

]

secondary_widgets = [
    # LEFT 
    *bar_menu,
    widget.CurrentLayoutIcon( scale = 0.5 ),

    widget.Spacer(),

    # MIDDLE
    workspaces, 

    widget.Spacer(),

    # RIGHT

    battery_widget,
    space_separator(), 

    *volume_widget,
    space_separator(), 

    hour_clock,
    space_separator(), 
    ]
