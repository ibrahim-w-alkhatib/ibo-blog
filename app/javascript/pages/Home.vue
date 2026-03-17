<template>
  <div>
    <h1>Ibrahim's Blog</h1>
    <div v-for="post in posts" :key="post.id">
      <h2>{{ post.title }}</h2>
      <p>{{ post.body }}</p>
    </div>
  </div>
</template>

<script setup>
defineProps({
  posts: Array
})
</script>
