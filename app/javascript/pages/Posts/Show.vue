<template>
    <div>
        <a href="/" class="back-link">← Back to all posts</a>
        <article>
            <h1>{{ post.title }}</h1>
            <small>{{ new Date(post.created_at).toLocaleDateString() }}</small>
            <div class="body">{{ post.body }}</div>
        </article>
    </div>
</template>

<script setup>
    defineProps( {
        post: Object
    })
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
</style>