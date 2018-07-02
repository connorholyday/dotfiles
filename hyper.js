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

        css: '',
        termCSS: '',

        padding: '10px',

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

        bell: false,
        copyOnSelect: false,

        hyperclean: {
            hideTabs: true,
        },
    },

    plugins: ['hyperterm-cursor', "hyperclean"],

    localPlugins: [],
    keymaps: {}
};
