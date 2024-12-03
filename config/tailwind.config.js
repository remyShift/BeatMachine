const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*',
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
        shrikhand: ['Shrikhand', ...defaultTheme.fontFamily.sans],
        gillSans: ['Gill Sans', ...defaultTheme.fontFamily.sans],
        roboto: ['Roboto', ...defaultTheme.fontFamily.sans],
        outfit: ['Outfit', ...defaultTheme.fontFamily.sans],
      },
      colors: {
        orange: '#ffa400',
        darkblue: '#2a2a72',
        darkgrey: '#232528',
        customGrey: '#4C4249',
        customBlue: '#1F6BC1',
        customGreen: '#7CEA9C',
        customforestGreen: '#149039',
        dadarkgrey: '#372F34',
        primary: '#f05643',
        greyy: '#404041',
        yelloww: '#fec057',
        blackk: '#231f20',
        pink: '#ff0f7b',
        orangee: '#f89b29',
      },
      boxShadow: {
        'top': '0 -4px 6px -1px rgba(0, 0, 0, 0.1)',
        'played': '0 0 10px 2px rgba(255, 255, 255, 0.7)',
      },
      backgroundImage: {
        'pad-gradient': "linear-gradient(to bottom, #E6E5EA, #E3E2E7)",
        'yellow-gradient': "radial-gradient(#e5c134, #9f8314)",
        'green-gradient': "radial-gradient(#8cd277, #53aa39)",
        'blue-gradient': "radial-gradient(#00f1ff, #0084b3)",
        'purple-gradient': "radial-gradient(#d64aac, #972374)",
        'red-gradient': "radial-gradient(#ff0000, #950000)",
        'pink-gradient': "radial-gradient(#00b3b3, #004d4d)",
        'default-pad': "rgba(130, 130, 130, 0.4)",
        'first-temp': "radial-gradient(circle, rgba(119,119,119,1) 52%, rgba(48,48,48,1) 94%)"
      },
      extend: {
        screens: {
          'iphone-se': '375px',
        },
      },
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/typography'),
    require('@tailwindcss/container-queries'),
  ]
}
