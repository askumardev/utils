Steps to Open Terminal in Sublime Text Editor
Step 1: Open Sublime Text

Step 2: Open Command Palette using the command Ctrl+shift+p

Type the below until the option appears and select it.

Package Control: Install Package

Note: You’ll need to install package control if you are using it for the first time.

Type ‘Terminus’ and select it. Wait for it to Complete installation and Restart Sublime Text.

Step 3: Now go to Preferences >Package Settings > Terminus > Command Palette

[
   {
        "caption": "Terminal (panel)",
        "command": "terminus_open",
        "args"   : {
           "cmd": "bash",
           "cwd": "${file_path:${folder}}",
           "title": "Command Prompt",
           "panel_name": "Terminus"
        }
   },
]  
Step 4: Now go to Preferences > Package Settings > Terminus > Key Bindings
[
    {
        "keys": ["alt+1"], "command": "toggle_terminus_panel", "args": {
            "cwd": "${file_path:${folder}}"
        }
    }
]
