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
    RUNTIME
} = (typeof api !== "undefined") ? api : window;

// Visible confirmation when config is loaded / reloaded
Front.showBanner("SurfingKeys config loaded from dotfiles!", 3000);

// Test mapping: Type 'gX' to display a test notification
mapkey('gX', '#99Test custom mapping from dotfiles', function() {
    Front.showBanner("Custom mapping (gX) works perfectly! 🚀", 3000);
});
