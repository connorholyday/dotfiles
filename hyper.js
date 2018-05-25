// Future versions of Hyper may add additional config options,
// which will not automatically be merged into this file.
// See https://hyper.is#cfg for all currently supported options.
// for advanced config flags please refer to https://hyper.is/#cfg

module.exports = {
    config: {
        updateChannel: 'stable',
        fontSize: 15,
        fontFamily: 'Menlo, "DejaVu Sans Mono", Consolas, "Lucida Console", monospace',

        // terminal cursor background color and opacity (hex, rgb, hsl, hsv, hwb or cmyk)
        cursorColor: '#ff6ac1',

        // `BEAM` for |, `UNDERLINE` for _, `BLOCK` for █
        cursorShape: 'BLOCK',
        cursorBlink: false,

        // color of the text
        foregroundColor: '#eff0eb',

        // terminal background color
        backgroundColor: '#282a36',
        borderColor: '#222430',

        // custom css to embed in the main window
        css: '',

        // custom css to embed in the terminal window
        termCSS: '',

        // custom padding (css format, i.e.: `top right bottom left`)
        padding: '10px',

        // the full list. if you're going to provide the full color palette,
        // including the 6 x 6 color cubes and the grayscale map, just provide
        // an array here instead of a color map object
        colors: {
            black: '#282a36',
            red: '#ff5c57',
            green: '#5af78e',
            yellow: '#f3f99d',
            blue: '#57c7ff',
            magenta: '#ff6ac1',
            cyan: '#9aedfe',
            white: '#f1f1f0',
            lightBlack: '#43454F',
            lightRed: '#ff5c57',
            lightGreen: '#5af78e',
            lightYellow: '#f3f99d',
            lightBlue: '#57c7ff',
            lightMagenta: '#ff6ac1',
            lightCyan: '#9aedfe',
            lightWhite: '#eff0eb'
        },

        shellArgs: ['--login'],

        // for environment variables
        env: {},

        // set to false for no bell
        bell: 'SOUND',
        copyOnSelect: false,

        opacity: 0.95,

        hyperclean: {
            hideTabs: true,
        },
    },

    plugins: ['hyperterm-cursor', "hyper-opacity", "hyperclean"],

    // in development, you can create a directory under
    // `~/.hyper_plugins/local/` and include it here
    // to load it and avoid it being `npm install`ed
    localPlugins: [],

    keymaps: {
        // Example
        // 'window:devtools': 'cmd+alt+o',
    }
};
