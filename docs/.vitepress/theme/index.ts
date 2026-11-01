import DefaultTheme from 'vitepress/theme'
import type { Theme } from 'vitepress'
import DemoFrame from './DemoFrame.vue'
import NoteIndex from './NoteIndex.vue'
import './custom.css'

export default {
  extends: DefaultTheme,
  enhanceApp({ app }) {
    app.component('DemoFrame', DemoFrame)
    app.component('NoteIndex', NoteIndex)
  },
} satisfies Theme
