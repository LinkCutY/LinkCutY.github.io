<script setup lang="ts">
import { computed } from 'vue'
import { useData, withBase } from 'vitepress'

// 直接把左侧目录的数据渲染成一张卡片列表，
// 加了新笔记不用回来改这页
const { theme } = useData()

const groups = computed(() => {
  const sb: any = (theme.value as any)?.sidebar
  const list: any[] = Array.isArray(sb) ? sb : sb?.['/notes/'] ?? []
  return list.filter((g) => g && Array.isArray(g.items) && g.items.length)
})
</script>

<template>
  <div class="note-cards">
    <section v-for="g in groups" :key="g.text" class="note-cards__group">
      <h3 v-if="g.text && groups.length > 1" class="note-cards__title">{{ g.text }}</h3>
      <ul>
        <li v-for="it in g.items" :key="it.link">
          <a :href="withBase(it.link)">{{ it.text }}</a>
        </li>
      </ul>
    </section>
  </div>
</template>
