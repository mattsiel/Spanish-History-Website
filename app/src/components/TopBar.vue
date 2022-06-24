<script setup>
  import TopBarItem from './TopBarItem.vue';
</script>

<template>
    <div id="topbar" >
        <TopBarItem>
            <template #heading>Documentation</template>
        </TopBarItem>

        <TopBarItem>
            <template #heading>Tooling</template>
        </TopBarItem>

        <TopBarItem>
            <template #heading>Ecosystem</template>
        </TopBarItem>

        <TopBarItem>
            <template #heading>Community</template>
        </TopBarItem>

        <TopBarItem>
            <template #heading>Support Vue</template>
        </TopBarItem>
    </div>
</template>


<style>
#topbar {
  left:0rem;
  top:0rem;
  background-color: bisque;
  height:100px;
  width:100%;
  z-index:1;
  overflow:hidden;
  position:relative;
  animation : animateDown .4s;
}
</style>
