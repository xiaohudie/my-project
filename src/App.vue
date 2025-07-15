<template>
  <div class="app">
    <el-menu
      class="nav-bar"
      mode="horizontal"
      :router="true"
      :default-active="currentPath"
    >
      <div class="nav-indicator" :style="indicatorStyle"></div>
      <el-menu-item
        v-for="(item, index) in navItems"
        :key="item.path"
        :index="item.path"
        @mouseenter="updateIndicator(index)"
      >
        <el-icon>
          <component :is="item.icon" />
        </el-icon>
        <span>{{ item.label }}</span>
      </el-menu-item>
    </el-menu>

    <main class="content">
      <router-view v-slot="{ Component }">
        <transition name="fade" mode="out-in">
          <component :is="Component" />
        </transition>
      </router-view>
    </main>
  </div>
</template>

<script>
import { ref, computed, onMounted, reactive } from 'vue';
import { useRouter, useRoute } from 'vue-router';
import { Document, Collection, MagicStick } from '@element-plus/icons-vue';

export default {
  name: 'App',
  components: {
    Document,
    Collection,
    MagicStick
  },
  setup() {
    const router = useRouter();
    const route = useRoute();
    const indicatorStyle = ref({
      width: '0px',
      transform: 'translateX(0px)'
    });
    
    const navItems = [
      { label: '简历', path: '/', icon: 'Document' },
      { label: '作品集', path: '/portfolio', icon: 'Collection' },
      { label: '趣玩', path: '/fun', icon: 'MagicStick' }
    ];

    const currentPath = computed(() => route.path);

    const updateIndicator = (index) => {
      const menu = document.querySelector('.nav-bar');
      const items = menu.querySelectorAll('.el-menu-item');
      const activeItem = items[index];
      
      if (activeItem) {
        const { left, width } = activeItem.getBoundingClientRect();
        const menuLeft = menu.getBoundingClientRect().left;
        
        indicatorStyle.value = {
          width: `${width}px`,
          transform: `translateX(${left - menuLeft}px)`
        };
      }
    };

    onMounted(() => {
      const currentIndex = navItems.findIndex(item => item.path === currentPath.value);
      updateIndicator(currentIndex);
    });

    const obj = reactive({
    a: 1,
    b: 2,
})

const { a, b } = obj
obj.a = 3
console.log('2323',a);

    return {
      navItems,
      currentPath,
      indicatorStyle,
      updateIndicator
    };
  }
};
</script>

<style>
.app {
  min-height: 100vh;
  background-color: var(--el-bg-color);
}

.nav-bar {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  z-index: 1000;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
}

.nav-bar :deep(.el-menu-item) {
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 8px;
  transition: all 0.3s ease;
}

.nav-bar :deep(.el-menu-item.is-active) {
  transform: translateY(-2px);
}

.nav-bar :deep(.el-menu-item:hover) {
  transform: translateY(-1px);
}

.nav-bar :deep(.el-icon) {
  margin-right: 4px;
  transition: transform 0.3s ease;
}

.nav-bar :deep(.el-menu-item:hover .el-icon) {
  transform: scale(1.1);
}

/* 修改蓝色指示条的动画效果 */
.nav-bar :deep(.el-menu--horizontal) {
  border-bottom: none;
  position: relative;
}

.nav-indicator {
  position: absolute;
  bottom: 0;
  left: 0;
  height: 2px;
  background-color: var(--el-color-primary);
  transition: all 0.3s ease;
}

.nav-bar :deep(.el-menu--horizontal > .el-menu-item.is-active) {
  border-bottom: none;
}

.nav-bar :deep(.el-menu--horizontal > .el-menu-item) {
  border-bottom: none;
}

.content {
  padding-top: 80px;
  padding-left: 24px;
  padding-right: 24px;
  max-width: 1200px;
  margin: 0 auto;
}

.fade-enter-active,
.fade-leave-active {
  transition: opacity 0.3s ease;
}

.fade-enter-from,
.fade-leave-to {
  opacity: 0;
}
</style> 