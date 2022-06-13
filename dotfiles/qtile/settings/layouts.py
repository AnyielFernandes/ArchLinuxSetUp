from typing import List  # noqa: F401
from libqtile import layout
from libqtile.config import Match
from settings.variables import colors

layout_conf = {
    'border_focus': colors["border_focus"],
    'border_normal': colors["non_active_window"], 
    'border_width': 1,
    'margin': 10
}

layouts = [
    layout.Max(),
    layout.MonadTall(**layout_conf),
    layout.Matrix(**layout_conf),
    layout.VerticalTile(**layout_conf,),
    layout.Stack(num_stacks=2,**layout_conf),
    # layout.Bsp(),
    # layout.Columns(),
    # layout.MonadWide(**layout_conf),
    # layout.RatioTile(),
    # layout.Tile(),
    # layout.TreeTab(),
    # layout.Zoomy(),
]

# @hook.subscribe.client_new
# def set_floating(window):
#     if (window.window.get_wm_transient_for()
#             or window.window.get_wm_type() in floating_types):
#         window.floating = True

# floating_types = ["notification", "toolbar", "splash", "dialog"]

floating_layout = layout.Floating(**layout_conf, float_rules=[
    # Run the utility of `xprop` to see the wm class and name of an X client.
    *layout.Floating.default_float_rules,
    Match(wm_class='confirmreset'),  # gitk
    Match(wm_class='makebranch'),  # gitk
    Match(wm_class='maketag'),  # gitk
    Match(wm_class='ssh-askpass'),  # ssh-askpass
    Match(wm_class='confirm'),  # gitk
    Match(wm_class='dialog'),  # gitk
    Match(wm_class='download'),  # gitk
    Match(wm_class='file_progress'),  # gitk
    Match(wm_class='error'),  # gitk
    Match(wm_class='notification'),  # gitk
    Match(wm_class='spash'),  # gitk
    Match(wm_class='toolbar'),  # gitk

    Match(title='branchdialog'),  # gitk
    Match(title='pinentry'),  # GPG key password entry
])
