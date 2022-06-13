from typing import List  # noqa: F401
from libqtile.config import Key, Group
from libqtile.lazy import lazy
from settings.keys import mod, keys

##### GROUPS #####
# group_names = [("", {'layout': 'max'}),
#                ("", {'layout': 'monadtall'}),
#                ("", {'layout': 'max'}),
#                ("", {'layout': 'monadtall'}),
#                ("", {'layout': 'max'}),
#                ("", {'layout': 'max'}),
#                ("", {'layout': 'stack'}),
#                ("", {'layout' : 'max'}),
#                ("", {'layout': 'max'}), ]
group_names = [("1", {'layout': 'max'}),
               ("2", {'layout': 'monadtall'}),
               ("3", {'layout': 'max'}),
               ("4", {'layout': 'monadtall'}),
               ("5", {'layout': 'max'}),
               ("6", {'layout': 'max'}),
               ("7", {'layout': 'stack'}),
               ("8", {'layout' : 'max'}),
               ("9", {'layout': 'max'}), ]

groups = [Group(name=name, label="", **kwargs) for name, kwargs in group_names]

for i, (name, kwargs) in enumerate(group_names, 1):
    keys.append(Key([mod], str(i), lazy.group[name].toscreen()))        # Switch to another group
    keys.append(Key([mod, "shift"], str(i), lazy.window.togroup(name))) # Send current window to another group	

