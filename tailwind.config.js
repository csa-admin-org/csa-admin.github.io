const colors = require('tailwindcss/colors')

module.exports = {
  content: ["./source/**/*.slim"],
  theme: {
    extend: {
      colors: {
        green: '#21952f'
      }
    }
  }
};
