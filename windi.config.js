import { defineConfig } from 'vite-plugin-windicss'
import colors from 'windicss/colors'
import icons from '@windicss/plugin-icons'

export default defineConfig({
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
  },
  plugins: [
    icons,
    require('windicss/plugin/aspect-ratio'),
  ]

})