const colors = require('tailwindcss/colors')

module.exports = {
  content: ["./source/**/*.erb"],
  theme: {
    extend: {
      colors: {
        'logo-green': '#158923'
      }
    }
  }
};
