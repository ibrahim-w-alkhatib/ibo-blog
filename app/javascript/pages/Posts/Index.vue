<template>
    <div>
        <h1>Ibrahim's Blog</h1>

        <div v-for="post in posts" :key="post.id" class="post-card">
            <Link :href="`/posts/${post.id}`">
                <h2>{{ post.title }}</h2>
            </Link>
            <p>{{ post.body.substring(0, 150) }}...</p>
            <small>{{ new Date(post.created_at).toLocaleDateString() }}</small>
        </div>
    </div>
</template>

<script setup>
    import { Link } from '@inertiajs/vue3';

    defineProps({
        posts: Array
    })
</script>

<style scoped>
    .post-card {
    border: 1px solid #ddd;
    padding: 16px;
    margin-bottom: 12px;
    border-radius: 8px;
    }

    .post-card h2 {
    margin: 0 0 8px 0;
    }

    .post-card p {
    color: #555;
    margin: 0 0 8px 0;
    }

    .post-card small {
    color: #999;
    }
</style>