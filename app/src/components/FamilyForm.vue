<script>
    import axios from "axios"

    export default {
        name : 'AddFamilyInfo',
        data () {
            return {
              dynasty: {
                dynasty_name: "mattsi",
                dynasty_head: null,
                dynasty_creator_id: null,
                dynasty_start: null
              }
            }
        },
        methods:{
          submitForm(){
            console.log(this.dynasty);
            axios.post('http://localhost:3100/dynasty', this.dynasty)
              .then((res) => {
                  //Perform Success Action
              })
              .catch((error) => {
                  // error.response.status Check status code
              }).finally(() => {
                  //Perform action in always
              });
          }
        } 
    }
</script>

<template>
    <form v-on:submit.prevent="submitForm">
      <div>
        <h2>Dynasty Name</h2>
        <input type="text" v-model="dynasty.dynasty_name" />
      </div>

      <div>
        <h2>Dynasty Head</h2>
        <input type="number" v-model.number="dynasty.dynasty_head" />
      </div>

      <div>
        <h2>Dynasty Creator</h2>
        <input type="number" v-model.number="dynasty.dynasty_creator_id" />
      </div>

      <div>
        <h2>Dynasty Start</h2>
        <input type="date" v-model="dynasty.dynasty_start" />
      </div>

      <div>
        <h2>Submit</h2>
        <input type="submit" value="submit" v-on:click="submit" />
      </div>
    </form>
</template>

<style>

</style>