<script>
    import axios from "axios"

    export default {
        name : 'AddInformation',
        data (){
            return {
                name : '',
                age : '',
            }
        },
        methods : {
            onSubmit(e){
                e.preventDefault()
                if(!this.name){
                    alert('Please Add a Name')
                    return
                }
                const NewInformation = {
                    id: Math.floor(Math.random() * 100000),
                    name : this.name,
                    age : this.age,
                    reminder : this.reminder
                }
                this.$emit('add-information', newInformation)
                this.name = ' ',
                this.age = ' '

                axios.get("http://localhost:3100/person");
            }
        }
    }
</script>

<template>
  <form @submit="onSubmit" class="add-form">
    <div class="form-control">
      <label>Name</label>
      <input type="text" v-model="name" name="name" placeholder="Enter Your Name" />
    </div>
    <div class="form-control">
      <label>Age</label>
      <input
        type="text"
        v-model="age"
        name="age"
        placeholder="Enter Your Age"
      />
    </div>
    <input type="submit" value="Save Information" class="btn btn-block" />
  </form>
</template>

<style>

</style>