<template>
  <div class="portfolio">
    <h1>作品集</h1>
    <div class="projects-grid">
      <el-card
        v-for="project in projects"
        :key="project.id"
        class="project-card"
        @click="openProject(project)"
      >
        <img :src="project.image" :alt="project.title" class="project-image">
        <div class="project-content">
          <h3>{{ project.title }}</h3>
          <p>{{ project.description }}</p>
          <div class="project-tags">
            <el-tag
              v-for="tag in project.tags"
              :key="tag"
              class="project-tag"
            >
              {{ tag }}
            </el-tag>
          </div>
        </div>
      </el-card>
    </div>
  </div>
</template>

<script lang="ts">
import { defineComponent, ref } from 'vue';

interface Project {
  id: number;
  title: string;
  description: string;
  image: string;
  tags: string[];
}

export default defineComponent({
  name: 'Portfolio',
  setup() {
    const projects = ref<Project[]>([
      {
        id: 1,
        title: '项目一',
        description: '这是一个示例项目描述',
        image: '/project1.jpg',
        tags: ['Vue.js', 'Element Plus', 'WebGL']
      },
      {
        id: 2,
        title: '项目二',
        description: '这是另一个示例项目描述',
        image: '/project2.jpg',
        tags: ['React', 'Node.js', 'MongoDB']
      }
    ]);

    const openProject = (project: Project): void => {
      // 实现项目详情页面的跳转逻辑
      console.log('Opening project:', project.title);
    };

    return {
      projects,
      openProject
    };
  }
});
</script>

<style scoped>
.portfolio {
  padding: 24px;
}

h1 {
  color: var(--el-color-primary);
  margin-bottom: 32px;
}

.projects-grid {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
  gap: 24px;
  padding: 16px;
}

.project-card {
  cursor: pointer;
  transition: transform 0.3s ease;
  overflow: hidden;
}

.project-card:hover {
  transform: translateY(-4px);
}

.project-image {
  width: 100%;
  height: 200px;
  object-fit: cover;
}

.project-content {
  padding: 16px;
}

.project-content h3 {
  margin: 0 0 8px 0;
  color: var(--el-color-primary);
}

.project-content p {
  margin: 0 0 16px 0;
  color: var(--el-text-color-primary);
}

.project-tags {
  display: flex;
  flex-wrap: wrap;
  gap: 8px;
}

.project-tag {
  margin-right: 8px;
}
</style> 