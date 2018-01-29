// From my `hyper-one-dark`
const black = '#21252b';
const darkGrey = '#282c34';
const mediumGrey = '#5c6370';
const lightGrey = '#abb2bf';
const white = '#fff';
const red = '#e06c75';
const yellow = '#d19a66';
const green = '#98c379';
const cyan = '#56b6c2';
const blue = '#61afef';
const magenta = '#c678dd';

// See https://hyper.is#cfg for all currently supported options.
module.exports = {
  config: {
    updateChannel: 'stable',

    bell: 'SOUND',
    copyOnSelect: false,
    cursorBlink: false,
    cursorColor: lightGrey,
    cursorShape: 'BLOCK',
    env: {},
    fontFamily: '"Source Code Pro", monospace',
    fontSize: 12,
    shell: '',
    shellArgs: ['--login'],

    colors: {
      black,
      red,
      green,
      yellow,
      blue,
      magenta,
      cyan,
      white: lightGrey,
      lightBlack: mediumGrey,
      lightRed: red,
      lightGreen: green,
      lightYellow: yellow,
      lightBlue: blue,
      lightMagenta: magenta,
      lightCyan: cyan,
      lightWhite: white,
      colorCubes: white,
      grayscale: lightGrey,
    },
    foregroundColor: lightGrey,
    backgroundColor: darkGrey,
    borderColor: darkGrey,
    padding: '6px 3px',
    css: '',
    termCSS: `
      x-screen a {
        color: inherit;
      }

      x-screen a:hover {
        color: ${blue};
      }
    `,

    // plugins...
    hyperTabs: {
      border: true,
      closeAlign: 'right',
      tabIconsColred: true,
    },
  },

  plugins: [
    'hyper-statusline',
    'hyper-tabs-enhanced',
    'hypercwd',
    'hyperlinks',
  ],

  // `~/.hyper_plugins/local/`
  localPlugins: [],

  keymaps: {
    'tab:next': 'ctrl+tab',
    'tab:last': 'ctrl+shift+tab',
  },
};
