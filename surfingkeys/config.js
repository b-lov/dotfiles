// SurfingKeys configuration
// Repo: https://github.com/b-lov/dotfiles

// Destructure SurfingKeys modern API (compatible with v1.0+ and legacy)
const {
    mapkey,
    map,
    unmap,
    vmap,
    imap,
    cmap,
    Hints,
    Visual,
    Front,
    RUNTIME,
    settings
} = (typeof api !== "undefined") ? api : window;

// Visible confirmation when config is loaded / reloaded
Front.showBanner("SurfingKeys config loaded from dotfiles!", 3000);

// --- Hint Styling ---
// Modern dark navy badges with crisp light typography and subtle borders
const hintStyle = `
    background: #0c1a30 !important;
    background-color: #0c1a30 !important;
    color: #f8fafc !important;
    font-family: "JetBrains Mono", "Fira Code", "SF Mono", "Cascadia Code", "Roboto Mono", Consolas, monospace !important;
    font-size: 13px !important;
    font-weight: 600 !important;
    border: 1px solid #3b82f6 !important;
    border-radius: 4px !important;
    padding: 2px 6px !important;
    box-shadow: 0 2px 6px rgba(0, 0, 0, 0.4) !important;
    line-height: 1.25 !important;
    text-transform: uppercase !important;
`;

Hints.style(hintStyle);
Hints.style(hintStyle, 'text');

// --- Custom Keybindings ---
// Test mapping: Type 'gX' to display a test notification
mapkey('gX', '#99Test custom mapping from dotfiles', function() {
    Front.showBanner("Custom mapping (gX) works perfectly! 🚀", 3000);
});
