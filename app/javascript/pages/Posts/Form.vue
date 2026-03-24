<template>
    <div>
        <Link href="/" class="back-link">← Back to all posts</Link>

        <h1>{{ editing ? 'Edit Post' : 'New Post' }}</h1>

        <form @submit.prevent="submit">
            <div class="field">
                <label for="title">Title</label>
                <input
                id="title"
                v-model="form.title"
                type="text"
                placeholder="Enter your post title"
                />
                <span v-if="form.errors.title" class="error">{{ form.errors.title }}</span>
            </div>

            <div class="field">
                <label for="body">Body</label>
                <textarea
                id="body"
                v-model="form.body"
                rows="12"
                placeholder="Write your post content here..."
                ></textarea>
                <span v-if="form.errors.body" class="error">{{ form.errors.body }}</span>
            </div>

            <div class="field checkbox">
                <label>
                <input type="checkbox" v-model="form.published" />
                Published
                </label>
            </div>

            <button type="submit" :disabled="form.processing">
                {{ form.processing ? 'Saving...' : (editing ? 'Update Post' : 'Create Post') }}
            </button>
        </form>
    </div>
</template>

<script setup>
import { Link, useForm } from '@inertiajs/vue3';
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
    if(editing) {
        form.patch(`/posts/${props.post.id}`)
    } else {
        form.post('/posts')
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

.field {
  margin-bottom: 16px;
}

label {
  display: block;
  margin-bottom: 4px;
  font-weight: bold;
}

input[type="text"],
textarea {
  width: 100%;
  padding: 8px;
  border: 1px solid #ddd;
  border-radius: 4px;
  font-size: 16px;
}

textarea {
  resize: vertical;
}

.checkbox label {
  font-weight: normal;
  display: flex;
  align-items: center;
  gap: 8px;
}

.error {
  color: #dc2626;
  font-size: 14px;
}

button {
  background: #2563eb;
  color: white;
  border: none;
  padding: 10px 20px;
  border-radius: 4px;
  font-size: 16px;
  cursor: pointer;
}

button:hover {
  background: #1d4ed8;
}

button:disabled {
  background: #93c5fd;
  cursor: not-allowed;
}
</style>
