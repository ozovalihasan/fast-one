import { defineConfig } from 'vite-plugin-windicss'
import colors from 'windicss/colors'
import plugin from 'windicss/plugin'

export default defineConfig({
  attributify: true,
  extract: {
    include: [
      'app/views/**/*.{html,erb}',
      'app/helpers/**/*.rb',
      'app/javascript/**/*.{vue,js,ts,jsx,tsx}',
    ],
  },
  darkMode: 'class',
  shortcuts: {
    'btn': 'py-2 px-4 font-semibold rounded-lg text-shadow-md bg-transparent cursor-pointer text-center',
    'btn-primary': 'py-2 px-4 font-semibold rounded-lg border bg-first-500 hover:bg-first-600 text-white cursor-pointer text-center block',
    'btn-secondary': 'py-2 px-4 font-semibold rounded-lg border bg-white hover:bg-gray-100 cursor-pointer text-center block',
    'link-primary': 'text-first-500 hover:text-first-600',
    'btn-warning': 'py-2 px-4 font-semibold rounded-lg border bg-warning-500 hover:bg-warning-600 text-white cursor-pointer text-center block',
    'input-primary': 'bg-first-50 placeholder-black-900 outline-none p-2 w-full',
    'center-content': 'flex items-center justify-center'
  },
  theme: {
    extend: {
      colors: {
        primary: colors.black,
        transparent: 'transparent',
        current: 'currentColor',
        first: colors.sky, 
        second: colors.orange, 
        third: colors.yellow, 
        fourth: colors.red, 
        fifth: colors.green, 
        warning: colors.orange,
        error: colors.red,
        success: colors.green,
        info: colors.sky
      },
      borderColor: theme => ({
        DEFAULT: theme('colors.gray.200', 'currentColor'),
      }),
      boxShadow: theme => ({
        outline: `0 0 10px 2px ${theme('colors.second.500')}`,
      }),
      fill: theme => theme('colors'),
    },
    screens: {
      sm: '0px',
      md: '768px',
      lg: '1024px',
    },
  },
  plugins: [
    require('windicss/plugin/aspect-ratio'),
    plugin(({ addUtilities }) => {
      const newUtilities = {
        '.bottom-unset': {
          bottom: 'unset'
        },
        '.scroll-smooth': {
          "scroll-behavior": "smooth",
        },
      }
      addUtilities(newUtilities)
    }),

  ]

})