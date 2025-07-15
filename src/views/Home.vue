<template>
  <div class="home">
    <el-card class="resume-container">
      <template #header>
        <div class="resume-header">
          <h2>个人简历</h2>
          <el-button type="primary" @click="downloadResume" :icon="Download">
            下载简历
          </el-button>
        </div>
      </template>
      <div class="resume-image-container">
        <img 
          src="/resume.jpg" 
          alt="个人简历" 
          class="resume-image"
          @click="showFullImage"
        />
      </div>
    </el-card>

    <!-- 全屏图片预览 -->
    <el-dialog
      v-model="isFullScreen"
      :show-close="false"
      :close-on-click-modal="true"
      :close-on-press-escape="true"
      class="fullscreen-dialog"
      @close="hideFullImage"
    >
      <img 
        src="/resume.jpg" 
        alt="个人简历" 
        class="fullscreen-image"
      />
    </el-dialog>
  </div>
</template>

<script lang="ts">
import { defineComponent, ref } from 'vue';
import { Download } from '@element-plus/icons-vue';

export default defineComponent({
  name: 'Home',
  setup() {
    const isFullScreen = ref<boolean>(false);

    const showFullImage = (): void => {
      isFullScreen.value = true;
      document.body.style.overflow = 'hidden';
    };

    const hideFullImage = (): void => {
      isFullScreen.value = false;
      document.body.style.overflow = 'auto';
    };

    const downloadResume = (): void => {
      const link = document.createElement('a');
      link.href = '/ym.pdf';
      link.download = 'ym.pdf';
      link.click();
    };

    return {
      isFullScreen,
      showFullImage,
      hideFullImage,
      downloadResume,
      Download
    };
  }
});
</script>

<style scoped>
.home {
  padding: 24px;
}

.resume-container {
  max-width: 800px;
  margin: 0 auto;
}

.resume-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.resume-header h2 {
  margin: 0;
  color: var(--el-color-primary);
}

.resume-image-container {
  width: 100%;
  overflow: hidden;
  border-radius: 8px;
  cursor: pointer;
  transition: transform 0.3s ease;
}

.resume-image-container:hover {
  transform: scale(1.02);
}

.resume-image {
  width: 100%;
  height: auto;
  display: block;
}

.fullscreen-dialog :deep(.el-dialog__body) {
  padding: 0;
  display: flex;
  justify-content: center;
  align-items: center;
}

.fullscreen-image {
  max-width: 90%;
  max-height: 90vh;
  object-fit: contain;
}
</style> 