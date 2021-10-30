import { defineConfig } from 'vite'
import RubyPlugin from 'vite-plugin-ruby'
import WindiCSS from 'vite-plugin-windicss'
import StimulusHMR from 'vite-plugin-stimulus-hmr' 

export default defineConfig({
  plugins: [
    RubyPlugin(),
    WindiCSS({
      root: __dirname,
      
    }),
    StimulusHMR(),
  ],
})
