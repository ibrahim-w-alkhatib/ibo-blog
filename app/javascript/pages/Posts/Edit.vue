<template>
    <Form :post="post" />
</template>

<script setup>
import Form from './Form.vue';

const props = defineProps({
  post: Object
})
</script>