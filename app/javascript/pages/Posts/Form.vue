<template>
  <div class="animate-fade-in">
    <Link href="/" class="text-gray-500 no-underline hover:text-blue-400 text-sm transition-colors duration-200">← Back to all posts</Link>

    <h1 class="text-3xl font-bold text-gray-100 mt-6 mb-8">{{ editing ? 'Edit Post' : 'New Post' }}</h1>

    <form @submit.prevent="submit" class="space-y-6">
      <div>
        <label for="title" class="block text-sm font-semibold text-gray-400 mb-2">Title</label>
        <input
          id="title"
          v-model="form.title"
          type="text"
          placeholder="Enter your post title"
          class="w-full px-4 py-3 bg-gray-900 border border-gray-700 rounded-xl text-gray-100 placeholder-gray-600 focus:outline-none focus:ring-2 focus:ring-blue-500/50 focus:border-blue-500/50 transition-all duration-200"
        />
        <span v-if="form.errors.title" class="text-red-400 text-sm mt-1 block">{{ form.errors.title }}</span>
      </div>

      <div>
        <label for="body" class="block text-sm font-semibold text-gray-400 mb-2">Body</label>
        <textarea
          id="body"
          v-model="form.body"
          rows="14"
          placeholder="Write your post content here..."
          class="w-full px-4 py-3 bg-gray-900 border border-gray-700 rounded-xl text-gray-100 placeholder-gray-600 focus:outline-none focus:ring-2 focus:ring-blue-500/50 focus:border-blue-500/50 transition-all duration-200 resize-y"
        ></textarea>
        <span v-if="form.errors.body" class="text-red-400 text-sm mt-1 block">{{ form.errors.body }}</span>
      </div>

      <div class="flex items-center gap-2">
        <input type="checkbox" id="published" v-model="form.published" class="w-4 h-4 rounded bg-gray-900 border-gray-700" />
        <label for="published" class="text-sm text-gray-400">Published</label>
      </div>

      <button
        type="submit"
        :disabled="form.processing"
        class="bg-blue-600 text-white px-6 py-3 rounded-xl hover:bg-blue-500 transition-all duration-200 disabled:bg-gray-700 disabled:text-gray-500 disabled:cursor-not-allowed hover:shadow-lg hover:shadow-blue-500/20"
      >
        {{ form.processing ? 'Saving...' : (editing ? 'Update Post' : 'Create Post') }}
      </button>
    </form>
  </div>
</template>

<script setup>
import { Link, useForm } from '@inertiajs/vue3'

const props = defineProps({
  post: {
    type: Object,
    default: () => ({})
  }
})

const editing = !!props.post.id

const form = useForm({
  title: props.post.title || '',
  body: props.post.body || '',
  published: props.post.published || false,
})

const submit = () => {
  if (editing) {
    form.patch(`/posts/${props.post.id}`)
  } else {
    form.post('/posts')
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