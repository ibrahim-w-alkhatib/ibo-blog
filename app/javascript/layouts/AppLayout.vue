<template>
  <div class="min-h-screen bg-gray-950 text-gray-100">
    <nav class="border-b border-gray-800/50 backdrop-blur-sm bg-gray-950/80 sticky top-0 z-10">
      <div class="max-w-3xl mx-auto px-4 py-4 flex justify-between items-center">
        <Link href="/" class="text-xl font-bold no-underline bg-gradient-to-r from-blue-400 to-violet-400 bg-clip-text text-transparent hover:from-blue-300 hover:to-violet-300 transition-all duration-300">
          Ibo's Blog
        </Link>
        <div class="flex gap-4 items-center">
          <Link href="/" class="text-gray-400 no-underline hover:text-white transition-colors duration-200">Home</Link>
          <Link href="/about" class="text-gray-400 no-underline hover:text-white transition-colors duration-200">About</Link>
          <Link href="/posts/new" class="bg-blue-600 text-white no-underline px-3 py-1 rounded-lg text-sm hover:bg-blue-500 transition-colors duration-200">
            + New Post
          </Link>
        </div>
      </div>
    </nav>

    <div class="max-w-3xl mx-auto px-4 py-10">
      <transition name="flash">
        <div v-if="flashNotice" class="bg-green-500/10 border border-green-500/20 text-green-400 px-4 py-3 rounded-xl mb-6">
          {{ flashNotice }}
        </div>
      </transition>

      <transition name="flash">
        <div v-if="flashAlert" class="bg-red-500/10 border border-red-500/20 text-red-400 px-4 py-3 rounded-xl mb-6">
          {{ flashAlert }}
        </div>
      </transition>

      <slot />
    </div>
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
.flash-enter-active {
  transition: all 0.4s ease-out;
}
.flash-leave-active {
  transition: all 0.3s ease-in;
}
.flash-enter-from {
  opacity: 0;
  transform: translateY(-10px);
}
.flash-leave-to {
  opacity: 0;
  transform: translateY(-10px);
}
</style>
