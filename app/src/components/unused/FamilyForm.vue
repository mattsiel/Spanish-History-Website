<script>
    import axios from "axios"
    import FormScroller from "./FormScroller.vue"

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
    <form v-on:submit.prevent="submitForm" @keyup='nextItem'>
      <div>
        <h2>Dynasty Name</h2>
        <input type="text" v-model="dynasty.dynasty_name" :key='item.id' :class='{"active-item": currentItem === item.id}'/>
      </div>

      <div>
        <h2>Dynasty Head</h2>
        <input type="number" v-model.number="dynasty.dynasty_head"  :key='item.id' :class='{"active-item": currentItem === item.id}'/>
      </div>

      <div>
        <h2>Dynasty Creator</h2>
        <input type="number" v-model.number="dynasty.dynasty_creator_id" :key='item.id' :class='{"active-item": currentItem === item.id}'/>
      </div>

      <div>
        <h2>Dynasty Start</h2>
        <input type="date" v-model="dynasty.dynasty_start" :key='item.id' :class='{"active-item": currentItem === item.id}'/>
      </div>

      <div>
        <h2>Submit</h2>
        <input type="submit" value="submit" v-on:click="submit" :key='item.id' :class='{"active-item": currentItem === item.id}'/>
      </div>
    </form>
</template>

<style>

</style>