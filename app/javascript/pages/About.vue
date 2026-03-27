<template>
  <div class="animate-fade-in">
    <h1 class="text-4xl font-bold mb-3">
      <span class="bg-gradient-to-r from-blue-400 to-violet-400 bg-clip-text text-transparent">
        About Me
      </span>
    </h1>

    <div class="mt-8 space-y-6 text-gray-300 leading-relaxed text-lg">
      <p>
        Hey, I'm <strong class="text-white">Ibrahim</strong> — but most people call me Ibo. I'm a
        self-taught developer from Jordan.
      </p>

      <p>
        I started coding when I was 14 years old. No mentor, no formal education past 7th grade,
        no plan. Just curiosity and a stubborn refusal to give up. I used to open machines at home
        and try to fix them — sometimes breaking them in the process. That same energy led me to
        software.
      </p>

      <p>
        It hasn't been easy. I've failed more times than I can count. I've learned under pressure,
        forgotten what I learned, and had to learn it again. But every time I fall, I get back up
        and I get better.
      </p>

      <p>
        Right now I'm focused on becoming the best developer I can be — building real things,
        filling knowledge gaps, and learning to work with AI as a development partner. This blog
        is part of that journey.
      </p>

      <p>
        I built this blog with <strong class="text-white">Ruby on Rails</strong>,
        <strong class="text-white">Vue.js</strong>, and
        <strong class="text-white">Inertia</strong> — learning every piece along the way.
      </p>

      <p class="text-gray-500 italic">
        "With every failure I say I learned, and I'll get better."
      </p>
    </div>
  </div>
</template>

<style>
@keyframes fadeIn {
  from { opacity: 0; }
  to { opacity: 1; }
}

.animate-fade-in {
  animation: fadeIn 0.5s ease-out forwards;
}
</style>
