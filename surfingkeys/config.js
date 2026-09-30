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

/* --- Omnibar & Search Input --- */
#sk_omnibar {
    z-index: 2147483005 !important;
    background: #11111b !important;
    border: 1px solid #313244 !important;
    border-radius: 12px !important;
    box-shadow: 0 16px 40px rgba(0, 0, 0, 0.7) !important;
}
#sk_omnibarSearchArea {
    border-bottom: 1px solid #313244 !important;
    padding: 6px 12px !important;
    display: flex !important;
    align-items: center !important;
}
#sk_omnibarSearchArea .prompt {
    color: #89b4fa !important;
    font-size: 16px !important;
    font-family: "JetBrains Mono", monospace !important;
    font-weight: 600 !important;
    margin-right: 8px !important;
}
#sk_omnibarSearchArea .resultPage {
    color: #a6adc8 !important;
    font-size: 12px !important;
    font-family: "JetBrains Mono", monospace !important;
}
#sk_omnibarSearchArea > input {
    color: #cdd6f4 !important;
    font-family: "JetBrains Mono", "JetBrainsMono Nerd Font", monospace !important;
    font-size: 15px !important;
    padding: 8px 4px !important;
    background: transparent !important;
    border: none !important;
    outline: none !important;
}
#sk_omnibarSearchResult ul li {
    padding: 8px 14px;
    border-radius: 8px;
    margin: 3px 6px;
    transition: background 0.1s ease;
}
#sk_omnibarSearchResult ul li:nth-child(odd) {
    background: #181825;
}
#sk_omnibarSearchResult ul li.focused {
    background: #313244;
    color: #ffffff;
}
#sk_omnibarSearchResult li div.title {
    color: #cdd6f4;
    font-family: "JetBrains Mono", "JetBrainsMono Nerd Font", sans-serif;
    font-size: 13px;
    font-weight: 500;
}
#sk_omnibarSearchResult li.focused div.title {
    color: #ffffff;
    font-weight: 600;
}
#sk_omnibarSearchResult li div.url {
    color: #89b4fa;
    font-family: "JetBrains Mono", monospace;
    font-size: 11px;
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
    z-index: 2147483006 !important;
}
#sk_keystroke {
    background: #11111b;
    border: 1px solid #313244;
    border-radius: 8px;
    color: #cdd6f4;
    z-index: 2147483007 !important;
}
.sk_theme kbd {
    background: #181825;
    border: 1px solid #45475a;
    box-shadow: none;
    color: #cdd6f4;
}

/* --- Tabs Dropdown (#sk_tabs) --- */
#sk_tabs[style*="display: none"] {
    display: none !important;
}
#sk_tabs:not([style*="display: none"]) {
    display: flex !important;
    flex-direction: column !important;
}
#sk_tabs {
    position: fixed !important;
    top: 12px !important;
    left: 12px !important;
    width: auto !important;
    min-width: 320px !important;
    max-width: 500px !important;
    max-height: calc(100vh - 24px) !important;
    background: #11111b !important;
    border: 1px solid #313244 !important;
    border-radius: 12px !important;
    box-shadow: 0 16px 40px rgba(0, 0, 0, 0.7) !important;
    padding: 6px !important;
    overflow-y: auto !important;
    overflow-x: hidden !important;
    box-sizing: border-box !important;
    z-index: 2147483000 !important;
}
#sk_tabs::-webkit-scrollbar {
    width: 5px;
}
#sk_tabs::-webkit-scrollbar-thumb {
    background: #313244;
    border-radius: 3px;
}
#sk_tabs div.sk_tab {
    display: flex !important;
    align-items: center !important;
    justify-content: space-between !important;
    width: 100% !important;
    background: #181825 !important;
    color: #cdd6f4 !important;
    border: 1px solid transparent !important;
    border-radius: 8px !important;
    margin: 2px 0 !important;
    padding: 6px 10px !important;
    box-sizing: border-box !important;
    cursor: pointer !important;
    transition: background 0.12s ease, border-color 0.12s ease !important;
}
#sk_tabs div.sk_tab:hover {
    background: #252739 !important;
    border-color: #45475a !important;
}
#sk_tabs div.sk_tab.active {
    background: #313244 !important;
    border-color: #89b4fa !important;
}
#sk_tabs div.sk_tab.active::after {
    content: "ACTIVE";
    order: 2;
    margin-left: 10px;
    font-family: "JetBrains Mono", "JetBrainsMono Nerd Font", monospace;
    font-size: 10px;
    font-weight: 700;
    color: #a6e3a1;
    background: rgba(166, 227, 161, 0.15);
    border: 1px solid #a6e3a1;
    border-radius: 4px;
    padding: 2px 5px;
    letter-spacing: 0.5px;
    flex-shrink: 0;
}
#sk_tabs div.sk_tab_wrap {
    display: flex !important;
    align-items: center !important;
    flex: 1 !important;
    min-width: 0 !important;
    overflow: hidden !important;
    order: 1 !important;
}
#sk_tabs div.sk_tab_icon {
    display: flex !important;
    align-items: center !important;
    justify-content: center !important;
    margin-right: 8px !important;
    padding-left: 0 !important;
    flex-shrink: 0 !important;
}
#sk_tabs div.sk_tab_icon > img {
    width: 16px !important;
    height: 16px !important;
    border-radius: 3px !important;
}
#sk_tabs.vertical div.sk_tab_title,
#sk_tabs.horizontal div.sk_tab_title,
#sk_tabs div.sk_tab_title {
    font-family: "JetBrains Mono", "JetBrainsMono Nerd Font", -apple-system, BlinkMacSystemFont, sans-serif !important;
    font-size: 12px !important;
    font-weight: 500 !important;
    color: #cdd6f4 !important;
    white-space: nowrap !important;
    overflow: hidden !important;
    text-overflow: ellipsis !important;
    padding-left: 0 !important;
    min-width: 0 !important;
    max-width: 100% !important;
    width: auto !important;
}
#sk_tabs div.sk_tab.active div.sk_tab_title {
    color: #ffffff !important;
    font-weight: 600 !important;
}
#sk_tabs.vertical div.sk_tab_hint,
#sk_tabs.horizontal div.sk_tab_hint,
#sk_tabs div.sk_tab_hint {
    position: static !important;
    left: auto !important;
    top: auto !important;
    order: 2 !important;
    margin: 0 0 0 10px !important;
    background: #181825 !important;
    color: #89b4fa !important;
    border: 1px solid #89b4fa !important;
    border-radius: 4px !important;
    font-family: "JetBrains Mono", "JetBrainsMono Nerd Font", monospace !important;
    font-size: 11px !important;
    font-weight: 700 !important;
    padding: 1px 6px !important;
    min-width: 12px !important;
    text-align: center !important;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.4) !important;
    text-transform: uppercase !important;
    letter-spacing: 0.5px !important;
    float: none !important;
    display: inline-block !important;
    flex-shrink: 0 !important;
}
#sk_tabs div.tab_rocket {
    display: none !important;
}
`;
