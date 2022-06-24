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
  background-color: #f44336;
  color: white;
  height:100%;
  width:100%;
  text-align: center;
  display: inline-block;
}

.item:hover{
  background-color: white;
}

.item:active{
  background-color: blueviolet;
}

h3 {
  font-size: 1.2rem;
  font-weight: 500;
  margin: 0.4rem;
  color: var(--color-heading);
}
</style>


