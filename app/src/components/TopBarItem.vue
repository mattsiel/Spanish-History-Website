<script>
export default {
}

</script>

<template>
  <div class="item">
    <h3>
      <slot name="heading"></slot>
    </h3>
  </div>
</template>

<style scoped>
.item {
  top:-2rem;
  height:100%;
  width:100%;
  text-align: center;
  background-color: whitesmoke;
  display: inline-block;
}

.item:hover{
  background-color: lightgrey;
}

.item:active{
  background-color: grey;
}

h3 {
  font-size: 1.2rem;
  font-weight: 500;
  margin: 0.4rem;
  color: var(--color-heading);
}
</style>


