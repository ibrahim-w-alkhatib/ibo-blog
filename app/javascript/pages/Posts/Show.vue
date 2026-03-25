<template>
  <div>
    <Link href="/" class="back-link">← Back to all posts</Link>

    <article>
      <h1>{{ post.title }}</h1>
      <small>{{ new Date(post.created_at).toLocaleDateString() }}</small>
      <div class="body">{{ post.body }}</div>
    </article>

    <div class="actions">
      <Link :href="`/posts/${post.id}/edit`" class="edit-btn">Edit</Link>
      <button @click="deletePost" class="delete-btn">Delete</button>
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

<style scoped>
.back-link {
  display: inline-block;
  margin-bottom: 16px;
  color: #666;
  text-decoration: none;
}

.back-link:hover {
  color: #333;
}

article h1 {
  margin: 0 0 8px 0;
}

article small {
  color: #999;
}

.body {
  margin-top: 16px;
  line-height: 1.6;
}

.actions {
  margin-top: 24px;
  display: flex;
  gap: 12px;
}

.edit-btn {
  background: #2563eb;
  color: white;
  padding: 8px 16px;
  border-radius: 4px;
  text-decoration: none;
}

.edit-btn:hover {
  background: #1d4ed8;
}

.delete-btn {
  background: #dc2626;
  color: white;
  padding: 8px 16px;
  border-radius: 4px;
  border: none;
  font-size: 16px;
  cursor: pointer;
}

.delete-btn:hover {
  background: #b91c1c;
}
</style>
