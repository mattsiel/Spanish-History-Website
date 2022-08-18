import { defineStore } from 'pinia'

export const useDateStore = defineStore('date', {
  state: () => {
    return { date: null }
  },
  // could also be defined as
  // state: () => ({ count: 0 })
  actions: {
    define(newDate) {
      console.log(newDate);
      this.date = newDate;
      return this.date;
    },
    print(){
      return this.date;
    },
  },
})