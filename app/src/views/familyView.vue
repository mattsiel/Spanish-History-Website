
<script>
import FamilyCards from '../components/FamilyCards.vue';

export default {
  name: "App",
  components: { FamilyCards },
};

</script>

<template>
  <div id="family-view">
    <FamilyCards />
  </div>
</template>

<style>
#family-view {
  overflow-x: hidden;
}
</style>
