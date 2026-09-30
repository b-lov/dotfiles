// remap open link in new tab to F, in background to af
api.map("F", "af");
api.map("af", "gf");
api.unmap("gf");

// unmap > and < for youtube video speed adj.
api.unmap("<<");
api.unmap(">>");

// hints styling (Catppuccin Mocha)
const hintStyle = `
    font-family: "JetBrains Mono", "JetBrainsMono Nerd Font", monospace;
    font-size: 13px;
    font-weight: 600;
    color: #cdd6f4;
    background: #181825;
    border: 1px solid #89b4fa;
    border-radius: 5px;
    padding: 2px 6px;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.45);
    letter-spacing: 0.5px;
    text-transform: uppercase;
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
    z-index: 2147483005;
    background: #11111b;
    border: 1px solid #313244;
    border-radius: 12px;
    box-shadow: 0 16px 40px rgba(0, 0, 0, 0.7);
}
#sk_omnibarSearchArea {
    border-bottom: 1px solid #313244;
    padding: 6px 12px;
    display: flex;
    align-items: center;
}
#sk_omnibarSearchArea .prompt {
    color: #89b4fa;
    font-size: 16px;
    font-family: "JetBrains Mono", monospace;
    font-weight: 600;
    margin-right: 8px;
}
#sk_omnibarSearchArea .resultPage {
    color: #a6adc8;
    font-size: 12px;
    font-family: "JetBrains Mono", monospace;
}
#sk_omnibarSearchArea > input {
    color: #cdd6f4;
    font-family: "JetBrains Mono", "JetBrainsMono Nerd Font", monospace;
    font-size: 15px;
    padding: 8px 4px;
    background: transparent;
    border: none;
    outline: none;
}
.sk_theme #sk_omnibarSearchResult > ul > li,
.sk_theme #sk_omnibarSearchResult ul li {
    padding: 8px 14px;
    border-radius: 8px;
    margin: 3px 6px;
    transition: background 0.1s ease;
    background: #11111b;
}
.sk_theme #sk_omnibarSearchResult > ul > li:nth-child(odd),
.sk_theme #sk_omnibarSearchResult ul li:nth-child(odd) {
    background: #181825;
}
.sk_theme #sk_omnibarSearchResult > ul > li:nth-child(even),
.sk_theme #sk_omnibarSearchResult ul li:nth-child(even) {
    background: #11111b;
}
.sk_theme #sk_omnibarSearchResult > ul > li.focused,
.sk_theme #sk_omnibarSearchResult ul li.focused {
    background: #313244;
    color: #ffffff;
}
.sk_theme #sk_omnibarSearchResult li div.title {
    color: #cdd6f4;
    font-family: "JetBrains Mono", "JetBrainsMono Nerd Font", sans-serif;
    font-size: 13px;
    font-weight: 500;
}
.sk_theme #sk_omnibarSearchResult li.focused div.title {
    color: #ffffff;
    font-weight: 600;
}
.sk_theme #sk_omnibarSearchResult li div.url {
    color: #89b4fa;
    font-family: "JetBrains Mono", monospace;
    font-size: 11px;
}
.sk_theme #sk_omnibarSearchResult li.focused div.url {
    color: #b4befe;
}
.sk_theme #sk_omnibarSearchResult li span.annotation {
    color: #f5c2e7;
    font-family: "JetBrains Mono", monospace;
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
    z-index: 2147483006;
}
#sk_keystroke {
    background: #11111b;
    border: 1px solid #313244;
    border-radius: 8px;
    color: #cdd6f4;
    z-index: 2147483007;
}
.sk_theme kbd {
    background: #181825;
    border: 1px solid #45475a;
    box-shadow: none;
    color: #cdd6f4;
}

/* --- Tabs Dropdown (#sk_tabs) --- */
#sk_tabs {
    position: fixed;
    top: 12px;
    left: 12px;
    display: flex;
    flex-direction: column;
    width: auto;
    min-width: 320px;
    max-width: 500px;
    max-height: calc(100vh - 24px);
    background: #11111b;
    border: 1px solid #313244;
    border-radius: 12px;
    box-shadow: 0 16px 40px rgba(0, 0, 0, 0.7);
    padding: 6px;
    overflow-y: auto;
    overflow-x: hidden;
    box-sizing: border-box;
    z-index: 2147483000;
}
#sk_tabs::-webkit-scrollbar {
    width: 5px;
}
#sk_tabs::-webkit-scrollbar-thumb {
    background: #313244;
    border-radius: 3px;
}
#sk_tabs div.sk_tab {
    display: flex;
    align-items: center;
    justify-content: space-between;
    width: 100%;
    background: #181825;
    color: #cdd6f4;
    border: 1px solid transparent;
    border-radius: 8px;
    margin: 2px 0;
    padding: 6px 10px;
    box-sizing: border-box;
    cursor: pointer;
    transition: background 0.12s ease, border-color 0.12s ease;
}
#sk_tabs div.sk_tab:hover {
    background: #252739;
    border-color: #45475a;
}
#sk_tabs div.sk_tab.active {
    background: #313244;
    border-color: #89b4fa;
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
    display: flex;
    align-items: center;
    flex: 1;
    min-width: 0;
    overflow: hidden;
    order: 1;
}
#sk_tabs div.sk_tab_icon {
    display: flex;
    align-items: center;
    justify-content: center;
    margin-right: 8px;
    padding-left: 0;
    flex-shrink: 0;
}
#sk_tabs div.sk_tab_icon > img {
    width: 16px;
    height: 16px;
    border-radius: 3px;
}
#sk_tabs.vertical div.sk_tab_title,
#sk_tabs.horizontal div.sk_tab_title,
#sk_tabs div.sk_tab_title {
    font-family: "JetBrains Mono", "JetBrainsMono Nerd Font", -apple-system, BlinkMacSystemFont, sans-serif;
    font-size: 12px;
    font-weight: 500;
    color: #cdd6f4;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
    padding-left: 0;
    min-width: 0;
    max-width: 100%;
    width: auto;
}
#sk_tabs div.sk_tab.active div.sk_tab_title {
    color: #ffffff;
    font-weight: 600;
}
#sk_tabs.vertical div.sk_tab_hint,
#sk_tabs.horizontal div.sk_tab_hint,
#sk_tabs div.sk_tab_hint {
    position: static;
    left: auto;
    top: auto;
    order: 2;
    margin: 0 0 0 10px;
    background: #181825;
    color: #89b4fa;
    border: 1px solid #89b4fa;
    border-radius: 4px;
    font-family: "JetBrains Mono", "JetBrainsMono Nerd Font", monospace;
    font-size: 11px;
    font-weight: 700;
    padding: 1px 6px;
    min-width: 12px;
    text-align: center;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.4);
    text-transform: uppercase;
    letter-spacing: 0.5px;
    float: none;
    display: inline-block;
    flex-shrink: 0;
}
#sk_tabs div.tab_rocket {
    display: none;
}
`;
