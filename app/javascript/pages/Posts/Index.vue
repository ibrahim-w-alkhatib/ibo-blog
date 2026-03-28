<template>
  <div>
    <div class="mb-10">
      <h1 class="text-4xl font-bold mb-3 animate-fade-in">
        <span class="bg-gradient-to-r from-blue-400 via-violet-400 to-purple-400 bg-clip-text text-transparent">
          Latest Posts
        </span>
      </h1>
      <p class="text-gray-500 animate-fade-in-delayed">Thoughts, learnings, and things I'm building.</p>
    </div>

    <div class="mb-8 space-y-4 animate-fade-in">
      <input 
        v-model="search"
        type="text"
        placeholder="Search posts by title..."
        @input="filterPosts"
        class="w-full px-4 py-3 bg-gray-900 border border-gray-700 rounded-xl text-gray-100 placeholder-gray-600 focus:outline-none focus:ring-2 focus:ring-blue-500/50 focus:border-blue-500/50 transition-all duration-200"
      />

      <div class="flex gap-2">
        <button
          v-for="option in statusOptions"
          :key="option.value"
          @click="setStatus(option.value)"
          class="px-4 py-2 rounded-lg text-sm transition-all duration-200 cursor-pointer"
          :class="status === option.value
            ? 'bg-blue-600 text-white'
            : 'bg-gray-800 text-gray-400 hover:bg-gray-700 hover:text-gray-200'"
          >
          {{ option.label }}
        </button>
      </div>
    </div>

    <div class="space-y-4">
      <div
        v-for="(post, index) in posts"
        :key="post.id"
        class="group bg-gray-900 border border-gray-800 rounded-xl p-6 hover:border-blue-500/40 hover:bg-gray-900/80 transition-all duration-300 hover:-translate-y-1 hover:shadow-lg hover:shadow-blue-500/5"
        :style="{ animationDelay: `${index * 100}ms` }"
        :class="'animate-slide-up'"
      >
        <div class="flex justify-between items-start mb-2">
          <Link :href="`/posts/${post.id}`" class="no-underline">
            <h2 class="text-xl font-semibold text-gray-100 group-hover:text-blue-400 transition-colors duration-200">
              {{ post.title }}
            </h2>
          </Link>
          <span
            v-if="!post.published"
            class="text-xs bg-yellow-500/10 text-yellow-400 border border-yellow-500/20 px-2 py-1 rounded-lg"
          >
            Draft
          </span>
        </div>
        <p class="text-gray-500 leading-relaxed mb-3">{{ post.body.substring(0, 150) }}...</p>
        <div class="flex justify-between items-center">
          <small class="text-gray-600 text-sm">{{ new Date(post.created_at).toLocaleDateString() }}</small>
          <Link :href="`/posts/${post.id}`" class="text-blue-500 text-sm no-underline opacity-0 group-hover:opacity-100 transition-opacity duration-200">
            Read more →
          </Link>
        </div>
      </div>
    </div>

    <div v-if="posts.length === 0" class="text-center py-20 animate-fade-in">
      <div class="text-6xl mb-4">🔍</div>
      <p class="text-lg text-gray-500 mb-2">No posts found.</p>
      <button @click="clearFilters" class="text-blue-400 hover:text-blue-300 transition-colors cursor-pointer">
        Clear filters
      </button>
    </div>
  </div>
</template>

<script setup>
import { ref } from 'vue'
import { Link, router } from '@inertiajs/vue3'

const props = defineProps({
  posts: Array,
  filters: Object
})

const search = ref(props.filters.search)
const status = ref(props.filters.status)

const statusOptions = [
  {label: 'All', value: 'all'},
  {label: 'Published', value: 'published'},
  {label: 'Draft', value: 'draft'}
]

let searchTimeout = null

const filterPosts = () => {
  clearTimeout(searchTimeout)
  searchTimeout = setTimeout(() => {
    router.get('/', {
      search: search.value || undefined
    }, {
      preserveState: true,
      replace: true
    })
  }, 300)
}

const setStatus = (value) => {
  status.value = value
  applyFilters()
}

const applyFilters = () => {
  router.get('/', {
    search: search.value || undefined,
    status: status.value === 'all' ? undefined : status.value
  })
}

const clearFilters = () => {
  search.value = ''
  status.value = 'all'
  applyFilters()
}
</script>

<style>
@keyframes fadeIn {
  from { opacity: 0; }
  to { opacity: 1; }
}

@keyframes fadeInDelayed {
  from { opacity: 0; transform: translateY(5px); }
  to { opacity: 1; transform: translateY(0); }
}

@keyframes slideUp {
  from { opacity: 0; transform: translateY(20px); }
  to { opacity: 1; transform: translateY(0); }
}

.animate-fade-in {
  animation: fadeIn 0.6s ease-out forwards;
}

.animate-fade-in-delayed {
  opacity: 0;
  animation: fadeInDelayed 0.6s ease-out 0.2s forwards;
}

.animate-slide-up {
  opacity: 0;
  animation: slideUp 0.5s ease-out forwards;
}
</style>
