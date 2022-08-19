<script>

  import { RouterLink, RouterView } from 'vue-router';

  export default {
    name: "TopBarItem",
    props: {
      title: null,
      router: null,
    }
  }

</script>

<template>
    <RouterLink :to=router class="item">
      <h3>{{ title }}</h3>
    </RouterLink>
</template>

<style scoped>
.item {
  top:0;
  text-align: center;
  background-color: whitesmoke;
  display: inline-block;
  flex-grow: 1;
  justify-content: center;
}

.item:hover{
  background-color: lightgrey;
}

.item:active{
  background-color: grey;
}

</style>


