from typing import List  # noqa: F401
from libqtile.config import Drag, Click
from libqtile.command import lazy
from settings.keys import mod

# Drag floating layouts.
mouse = [
    Drag([], "Button2", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod, "alt"], "Button1", lazy.window.bring_to_front())
]
