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
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/typography'),
    require('@tailwindcss/container-queries'),
  ]
}
