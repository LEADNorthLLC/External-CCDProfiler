/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./src/**/*.{html,ts}",
  ],
  theme: {
    extend: {
      colors: {
        sage: '#637b6d',
        sagehover: '#059669',
      }
    },
  },
  plugins: [],
  darkMode: 'class',
}

