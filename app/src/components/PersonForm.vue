<template>
<div class="form-group">
  <label for="firstName"> First Name </label>
    <input type="text"
        id="firstName"
        class="form-control"
        v-model="personData.firstName">

  <label for="birthDate">Birth Date</label>
    <input min="1"
      max="99999999"
      type="number"
      id="birthDate"
      class="form-control"
      v-model.number="userData.satisfaction">
</div>    
</template>

<script>
  export default {
    data() {
      return {
        userData: {
        firstName: "",
        byName: "",
        middleName: "",
        maidenName: "",
        lastName: "",
        gender: "M",
        birthDate: "",
        deathDate: "",
        placeBirth: "",
        placeDeath: "",
        causeDeath: "",
        familyId: "",
        personSource: "",
        dynastyId: ""
        },
      };
    },
  };
</script>
