import { defineStore } from 'pinia'

export const useFamilyStore = defineStore('family', {
  state: () => {
    return { family: [] }
  },
  // could also be defined as
  // state: () => ({ count: 0 })
  actions: {
    define(newFamily) {
      this.family = newFamily;
      return this.date;
    },
    print(){
      return this.date;
    },
  },
})