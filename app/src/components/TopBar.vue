<script setup>
  import TopBarItem from './topBarItem.vue';

  function sidebarOpen() {
    document.getElementById("sidebar").style.height = "20%";
    document.getElementById("sidebar").style.display = "block";
    document.getElementById("openNav").style.display = 'none';

  }
  function sidebarClose() {
    document.getElementById("sidebar").classList.add('fadeUp');
    document.getElementById("openNav").style.display = "inline-block";
    document.getElementById("openNav").style.display = "inline-block";
  }



</script>

<template>
    <div id="sidebar" class="sidebar" style="display:none">
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

        <button id="closeNav" class="w3-button w3-teal w3-xlarge" @click ='sidebarClose()'>X</button>
    </div>

    <button id="openNav" class="w3-button w3-teal w3-xlarge" @click ='sidebarOpen()'>X

    </button>
</template>


<style scoped>
#openNav {
  background-color:darkgrey;
  width:100%;
  height:30px;
}

#openNav:active {
  animation : fadeOut .4s;
}

#closeNav {
  background-color:darkgrey;
  right:0px;
  width:30px;
  height:30px;
}

.fadeup{
  animation : animateUp .4s;
}

#sidebar {
  left:0rem;
  top:0rem;
  background-color: bisque;
  height:200px;
  width:100%;
  z-index:1;
  overflow:auto;
  position:relative;
  animation : animateDown .4s;
}

@keyframes animateDown{
  from {
    top:-300px;
    opacity:0;
  } to {
    top:0;
    opacity:1;
  }
}

@keyframes animateUp{
  from {
    top:-300px;
    opacity:0;
  } to {
    top:0;
    opacity:1;
  }
}

@keyframes fadeOut {
  from {
    opacity:1;
  } to {
    opacity:0;
    display:none;
  }
}
</style>
