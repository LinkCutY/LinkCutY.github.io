import { defineConfig } from 'vitepress'
import mathjax3 from 'markdown-it-mathjax3'
import fs from 'node:fs'
import path from 'node:path'

// 部署位置：用户站 BASE=/，项目站 BASE=/仓库名/
const base = process.env.BASE || '/'

// 自动扫 docs/notes/*.md 生成左侧目录：
//   文件名 -> 网址，文件里第一个 "# 标题" -> 目录里显示的名字
// 所以加笔记 / 删笔记都不用改这个文件
function scanNotes() {
  const dir = path.resolve(process.cwd(), 'docs/notes')
  if (!fs.existsSync(dir)) return []
  return fs
    .readdirSync(dir)
    .filter((f) => f.endsWith('.md') && f !== 'index.md')
    .sort()
    .map((f) => {
      const src = fs.readFileSync(path.join(dir, f), 'utf8').replace(/^\uFEFF/, '')
      const m = src.match(/^#\s+(.+)$/m)
      return {
        text: (m ? m[1] : f.replace(/\.md$/, '')).trim(),
        link: '/notes/' + f.replace(/\.md$/, ''),
      }
    })
}

export default defineConfig({
  base,
  lang: 'zh-CN',
  title: '奇怪小问题',
  description: '一个用 Markdown 写、用 GitHub Pages 发布的笔记本',
  lastUpdated: true,
  head: [['link', { rel: 'icon', href: '/favicon.svg' }]],
  markdown: {
    math: true,
    config(md) {
      md.use(mathjax3)
    },
  },
  themeConfig: {
    nav: [
      { text: '笔记', link: '/notes/', activeMatch: '/notes/' },
      { text: '关于', link: '/about' },
    ],
    sidebar: {
      '/notes/': [{ text: '笔记', items: scanNotes() }],
    },
    outline: { level: [2, 3], label: '本页目录' },
    search: { provider: 'local' },
    docFooter: { prev: '上一篇', next: '下一篇' },
    lastUpdated: {
      text: '最后更新',
      formatOptions: { dateStyle: 'short', timeStyle: 'short' },
    },
    editLink: {
      pattern: 'https://github.com/LinkCutY/LinkCutY.github.io/edit/main/docs/:path',
      text: '在 GitHub 上编辑这页',
    },
    socialLinks: [{ icon: 'github', link: 'https://github.com/LinkCutY' }],
    darkModeSwitchLabel: '配色',
    sidebarMenuLabel: '目录',
    returnToTopLabel: '回到顶部',
    footer: {
      message: '用 Markdown 写，用 GitHub Pages 发。',
      copyright: '© 2026 LinkCutY',
    },
  },
})
