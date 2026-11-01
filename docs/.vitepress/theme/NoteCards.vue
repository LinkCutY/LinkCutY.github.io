<script setup lang="ts">
import { computed } from 'vue'
import { useData, withBase } from 'vitepress'

// 站点没开 cleanUrls，链接要补 .html 才能在本地预览里也打得开
const toUrl = (link: string) => withBase(/\.html?$/.test(link) ? link : link + '.html')

// 卡片列表：数据来自左侧目录（构建时扫描 docs/notes 得到）
const { theme } = useData()

const notes = computed(() => {
  const sb: any = (theme.value as any)?.sidebar
  const list: any[] = Array.isArray(sb) ? sb : sb?.['/notes/'] ?? []
  return list.flatMap((g) => (Array.isArray(g?.items) ? g.items : []))
})
</script>

<template>
  <div class="note-grid">
    <a v-for="n in notes" :key="n.link" class="note-card" :href="toUrl(n.link)">
      <span class="note-card__title">{{ n.text }}</span>
      <span v-if="n.excerpt" class="note-card__excerpt">{{ n.excerpt }}</span>
    </a>
  </div>
</template>
