const colors = require('tailwindcss/colors')

module.exports = {
  content: ["./source/**/*.slim"],
  theme: {
    extend: {
      colors: {
        'logo-green': '#158923'
      }
    }
  }
};
