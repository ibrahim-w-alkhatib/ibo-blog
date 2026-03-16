<template>
  <div>
    <h1>Hello {{ name }}!</h1>
    <p>Vue + Rails + Inertia — connected.</p>
  </div>
</template>

<script setup>
defineProps({
  name: String
})
</script>
