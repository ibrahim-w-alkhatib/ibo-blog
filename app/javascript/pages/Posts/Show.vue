<template>
  <div class="animate-fade-in">
    <Link href="/" class="text-gray-500 no-underline hover:text-blue-400 text-sm transition-colors duration-200">← Back to all posts</Link>

    <article class="mt-8">
      <h1 class="text-4xl font-bold text-gray-100 mb-3">{{ post.title }}</h1>
      <small class="text-gray-500">{{ new Date(post.created_at).toLocaleDateString() }}</small>
      <div class="mt-8 text-gray-300 leading-relaxed text-lg prose prose-invert prose-lg" v-html="post.body_html"></div>
    </article>

    <div class="mt-10 pt-6 border-t border-gray-800 flex gap-3">
      <Link
        :href="`/posts/${post.id}/edit`"
        class="bg-gray-800 text-gray-300 px-4 py-2 rounded-lg no-underline hover:bg-gray-700 hover:text-white transition-all duration-200"
      >
        Edit
      </Link>
      <button
        @click="deletePost"
        class="bg-red-500/10 text-red-400 border border-red-500/20 px-4 py-2 rounded-lg hover:bg-red-500/20 transition-all duration-200 cursor-pointer"
      >
        Delete
      </button>
    </div>
  </div>
</template>

<script setup>
import { Link, router } from '@inertiajs/vue3'

const props = defineProps({
  post: Object
})

const deletePost = () => {
  if (confirm('Are you sure you want to delete this post?')) {
    router.delete(`/posts/${props.post.id}`)
  }
}
</script>

<style>
@keyframes fadeIn {
  from { opacity: 0; }
  to { opacity: 1; }
}

.animate-fade-in {
  animation: fadeIn 0.5s ease-out forwards;
}
</style>
