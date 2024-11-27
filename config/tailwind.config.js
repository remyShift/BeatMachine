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
      },
      colors: {
        orange: '#ffa400',
        darkblue: '#2a2a72',
        darkgrey: '#232528',
      },
      boxShadow: {
        'top': '0 -4px 6px -1px rgba(0, 0, 0, 0.1)',
        'played': '0 0 5px 5px rgba(255, 255, 255, 0.7)',
      },
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/typography'),
    require('@tailwindcss/container-queries'),
  ]
}
