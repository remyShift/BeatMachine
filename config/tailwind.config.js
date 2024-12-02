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
      },
      colors: {
        orange: '#ffa400',
        darkblue: '#2a2a72',
        darkgrey: '#232528',
        customGrey: '#485B70',
        customBlue: '#1F6BC1',
        customGreen: '#7CEA9C',
        customforestGreen: '#149039',
      },
      boxShadow: {
        'top': '0 -4px 6px -1px rgba(0, 0, 0, 0.1)',
        'played': '0 0 10px 2px rgba(255, 255, 255, 0.7)',
      },
      backgroundImage: {
        'sequencer-gradient': "radial-gradient(circle at 50% 50%,#0b007c, #171f4c, rgba(35,37,40,1))",
        'yellow-gradient': "radial-gradient(#e5c134, #9f8314)",
        'green-gradient': "radial-gradient(#8cd277, #53aa39)",
        'blue-gradient': "radial-gradient(#4faed4, #257798)",
        'purple-gradient': "radial-gradient(#d64aac, #972374)",
        'red-gradient': "radial-gradient(#b30000, #4d0000)",
        'pink-gradient': "radial-gradient(#00b3b3, #004d4d)",
        'default-pad': "rgba(130, 130, 130, 0.4)"
      },
      extend: {
        screens: {
          'iphone-se': '375px', // Breakpoint pour l'iPhone SE
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
