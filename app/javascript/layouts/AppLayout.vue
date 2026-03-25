<template>
  <div class="app">
    <nav class="navbar">
      <Link href="/" class="logo">Ibo's Blog</Link>
      <div class="nav-links">
        <Link href="/">Home</Link>
        <Link href="/posts/new">New Post</Link>
      </div>
    </nav>

    <div v-if="flashNotice" class="flash notice">
      {{ flashNotice }}
    </div>

    <div v-if="flashAlert" class="flash alert">
      {{ flashAlert }}
    </div>

    <main class="content">
      <slot />
    </main>
  </div>
</template>

<script setup>
import { computed } from 'vue'
import { Link, usePage } from '@inertiajs/vue3'

const page = usePage()
const flashNotice = computed(() => page.props.flash?.notice)
const flashAlert = computed(() => page.props.flash?.alert)
</script>

<style>
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

body {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
  color: #333;
  background: #f9fafb;
}

.app {
  max-width: 800px;
  margin: 0 auto;
  padding: 0 20px;
}

.navbar {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 20px 0;
  border-bottom: 1px solid #e5e7eb;
  margin-bottom: 32px;
}

.logo {
  font-size: 1.4em;
  font-weight: 700;
  color: #111;
  text-decoration: none;
}

.nav-links {
  display: flex;
  gap: 16px;
}

.nav-links a {
  color: #2563eb;
  text-decoration: none;
}

.nav-links a:hover {
  text-decoration: underline;
}

.flash {
  padding: 12px;
  border-radius: 8px;
  margin-bottom: 16px;
}

.flash.notice {
  background: #dcfce7;
  color: #166534;
}

.flash.alert {
  background: #fef2f2;
  color: #991b1b;
}

.content {
  padding-bottom: 40px;
}
</style>