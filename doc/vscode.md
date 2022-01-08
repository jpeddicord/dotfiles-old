Since VS Code doesn't really let you put settings in your dotfiles, some hand-management is needed.

## settings.json (local)

```json
{
    "breadcrumbs.enabled": false,
    "editor.fontFamily": "'JetBrains Mono', 'Cascadia Code', monospace",
    "editor.minimap.enabled": false,
    "editor.wordWrap": "bounded",
    "editor.wordWrapColumn": 99,
    "editor.rulers": [
        99
    ],
    "editor.smoothScrolling": true,
    "explorer.autoReveal": "focusNoScroll",
    "explorer.confirmDelete": false,
    "files.autoSave": "onFocusChange",
    "scm.inputFontFamily": "editor",
    "telemetry.telemetryLevel": "off",
    "window.titleBarStyle": "custom",
    "window.titleSeparator": " 🐲 ",
    "workbench.editor.scrollToSwitchTabs": true,
    "workbench.colorTheme": "Solarized Dark",

    // extensions
    "amVim.bindCtrlCommands": false,
    "amVim.mimicVimSearchBehavior": false,
}
```

## settings.json (remote)

```json
{
    "terminal.integrated.env.linux": {
        "GIT_EDITOR": "code --wait",
    },
    "telemetry.enableTelemetry": false,
}
```

## keybindings.json

```json
[
    {
        "key": "f2",
        "command": "workbench.action.terminal.new",
        "when": "terminalFocus"
    },
    {
        "key": "f3",
        "command": "workbench.action.terminal.focusPrevious",
        "when": "terminalFocus"
    },
    {
        "key": "f4",
        "command": "workbench.action.terminal.focusNext",
        "when": "terminalFocus"
    },
    {
        "key": "ctrl+\\",
        "command": "workbench.action.terminal.split",
        "when": "terminalFocus"
    },
]
```

## extensions

- auiworks.amvim
- matklad.rust-analyzer
- ms-vscode-remote.remote-wsl