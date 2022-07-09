<template>
<div class="form-group">
  <label for="familyName"> First Name </label>
    <input type="text"
        id="familyName"
        class="form-control"
        v-model="familyData.familyName">

  <label for="dynastyId">Birth Date</label>
    <input min="1"
      max="99999999"
      type="number"
      id="dynastyId"
      class="form-control"
      v-model.number="familyData.dynastyId">

    
  <label for="familyHead"> Family Head</label>
    <input min="1"
      max="99999999"
      type="number"
      id="familyHead"
      class="form-control"
      v-model.number="familyData.familyHead">

    
  <label for="familyCreator"> Family Creator</label>
    <input min="1"
      max="99999999"
      type="number"
      id="familyCreator"
      class="form-control"
      v-model.number="familyData.familyCreator">

</div>    
</template>

<script>
  export default {
    data() {
      return {
        familyData: {
        familyName:"",
        dynastyId: "",
        familyHead: "",
        familyCreator: ""
        },
      };
    },
    methods: {
      submitted() {
        this.isSubmitted = true;
      }
    },
  };
</script>
