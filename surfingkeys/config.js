// remap open link in new tab to F, in background to af
api.map("F", "af");
api.map("af", "gf");
api.unmap("gf");

// unmap > and < for youtube video speed adj.
api.unmap("<<");
api.unmap(">>");

// hints styling (Catppuccin Mocha)
const hintStyle = `
    font-family: "JetBrains Mono", "JetBrainsMono Nerd Font", monospace !important;
    font-size: 13px !important;
    font-weight: 600 !important;
    color: #cdd6f4 !important;
    background: #181825 !important;
    border: 1px solid #89b4fa !important;
    border-radius: 5px !important;
    padding: 2px 6px !important;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.45) !important;
    letter-spacing: 0.5px !important;
    text-transform: uppercase !important;
`;
api.Hints.style(hintStyle);
api.Hints.style(hintStyle, "text");

// set theme (Catppuccin Mocha)
settings.theme = `
.sk_theme {
    font-family: "JetBrains Mono", "JetBrainsMono Nerd Font", -apple-system, BlinkMacSystemFont, sans-serif;
    font-size: 11pt;
    background: #11111b;
    color: #cdd6f4;
    border-radius: 12px;
    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.5);
    border: 1px solid #313244;
}
.sk_theme tbody {
    color: #cdd6f4;
}
.sk_theme input {
    color: #cdd6f4;
    font-size: 13pt;
    padding: 10px 14px;
}
.sk_theme .url {
    color: #89b4fa;
}
.sk_theme .annotation {
    color: #f5c2e7;
}
.sk_theme .omnibar_highlight {
    color: #a6e3a1;
    font-weight: bold;
}
.sk_theme .omnibar_timestamp {
    color: #f9e2af;
}
.sk_theme .omnibar_visitcount {
    color: #94e2d5;
}
.sk_theme #sk_omnibarSearchResult ul li {
    padding: 6px 12px;
    border-radius: 6px;
    margin: 2px 6px;
}
.sk_theme #sk_omnibarSearchResult ul li:nth-child(odd) {
    background: #181825;
}
.sk_theme #sk_omnibarSearchResult ul li.focused {
    background: #313244;
    color: #ffffff;
}
#sk_status, #sk_find {
    font-family: "JetBrains Mono", "JetBrainsMono Nerd Font", monospace;
    font-size: 11pt;
    background: #11111b;
    color: #cdd6f4;
    border: 1px solid #313244;
    border-radius: 8px;
    padding: 6px 12px;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.4);
}
#sk_keystroke {
    background: #11111b;
    border: 1px solid #313244;
    border-radius: 8px;
    color: #cdd6f4;
}
.sk_theme kbd {
    background: #181825;
    border: 1px solid #45475a;
    box-shadow: none;
    color: #cdd6f4;
}
`;
