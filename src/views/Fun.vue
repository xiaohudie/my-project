<template>
  <div class="fun">
    <h1>趣玩</h1>
    <div class="fun-content">
      <el-card class="interactive-card" ref="card">
        <div class="card-content">
          <h3>互动卡片</h3>
          <p>点击卡片查看动画效果</p>
          <el-button type="primary" @click="triggerAnimation">
            开始动画
          </el-button>
        </div>
      </el-card>

      <el-card class="color-picker">
        <template #header>
          <h3>主题颜色</h3>
        </template>
        <div class="color-options">
          <el-button
            v-for="color in colors"
            :key="color.name"
            :style="{ backgroundColor: color.value }"
            @click="changeThemeColor(color.value)"
            class="color-button"
          >
            <el-icon><Brush /></el-icon>
          </el-button>
        </div>
      </el-card>
    </div>
  </div>
</template>

<script lang="ts">
import { defineComponent, ref } from 'vue';
import gsap from 'gsap';
import { Brush } from '@element-plus/icons-vue';

interface Color {
  name: string;
  value: string;
}

export default defineComponent({
  name: 'Fun',
  setup() {
    const card = ref<HTMLElement | null>(null);
    const colors: Color[] = [
      { name: 'teal', value: '#409EFF' },
      { name: 'purple', value: '#6750A4' },
      { name: 'blue', value: '#1D4ED8' },
      { name: 'green', value: '#67C23A' }
    ];

    const triggerAnimation = (): void => {
      if (card.value) {
        gsap.to(card.value, {
          rotation: 360,
          duration: 1,
          ease: 'power2.inOut'
        });
      }
    };

    const changeThemeColor = (color: string): void => {
      document.documentElement.style.setProperty('--el-color-primary', color);
    };

    return {
      card,
      colors,
      triggerAnimation,
      changeThemeColor,
      Brush
    };
  }
});
</script>

<style scoped>
.fun {
  padding: 24px;
}

h1 {
  color: var(--el-color-primary);
  margin-bottom: 32px;
}

.fun-content {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
  gap: 24px;
  padding: 16px;
}

.interactive-card {
  padding: 24px;
  text-align: center;
  cursor: pointer;
}

.card-content {
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 16px;
}

.color-picker {
  text-align: center;
}

.color-options {
  display: flex;
  gap: 16px;
  margin-top: 16px;
  justify-content: center;
}

.color-button {
  width: 48px;
  height: 48px;
  border-radius: 50%;
  transition: transform 0.3s ease;
  padding: 0;
  display: flex;
  align-items: center;
  justify-content: center;
}

.color-button:hover {
  transform: scale(1.1);
}

.color-button :deep(.el-icon) {
  color: white;
  font-size: 20px;
}
</style> 