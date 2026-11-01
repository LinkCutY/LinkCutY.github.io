import { defineConfig } from 'vitepress'
import mathjax3 from 'markdown-it-mathjax3'
import fs from 'node:fs'
import path from 'node:path'

// 部署位置：用户站 BASE=/，项目站 BASE=/仓库名/
const base = process.env.BASE || '/'

// 去掉 Markdown 记号，取正文第一段当卡片摘要
function firstParagraph(src: string) {
  const lines = src.replace(/^\uFEFF/, '').split(/\r?\n/)
  for (const raw of lines) {
    const l = raw.trim()
    if (!l) continue
    if (/^(#|>|\||!\[|-{3})/.test(l)) continue
    return l
      .replace(/!\[[^\]]*\]\([^)]*\)/g, '')
      .replace(/\[([^\]]*)\]\([^)]*\)/g, '$1')
      .replace(/\$[^$]*\$/g, '')
      .replace(/[\x60*_~]/g, '')
      .replace(/\s+/g, ' ')
      .trim()
      .slice(0, 90)
  }
  return ''
}

// 自动扫 docs/notes/*.md：文件名是网址，第一个 "# 标题" 是显示名
function scanNotes() {
  const notesDir = path.resolve(process.cwd(), 'docs/notes')
  if (!fs.existsSync(notesDir)) return []
  return fs
    .readdirSync(notesDir)
    .filter((f) => f.endsWith('.md') && f !== 'index.md')
    .sort()
    .map((f) => {
      const src = fs.readFileSync(path.join(notesDir, f), 'utf8')
      const m = src.match(/^#\s+(.+)$/m)
      return {
        text: (m ? m[1] : f.replace(/\.md$/, '')).trim(),
        link: '/notes/' + f.replace(/\.md$/, ''),
        excerpt: firstParagraph(src),
      }
    })
}

export default defineConfig({
  base,
  lang: 'zh-CN',
  title: "LinkCutY's blog",
  description: 'CSAPP、操作系统、并行计算的学习笔记',
  lastUpdated: true,
  head: [
    ['link', { rel: 'icon', href: '/favicon.svg' }],
    // 让浏览器加载外链图片时不带 Referer，
    // 否则博客园 / 知乎这类有防盗链的图床会返回 403
    ['meta', { name: 'referrer', content: 'no-referrer' }],
  ],
  markdown: {
    math: true,
    config(md) {
      md.use(mathjax3)
    },
  },
  themeConfig: {
    nav: [],
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
      copyright: '© 2026 LinkCutY',
    },
  },
})
