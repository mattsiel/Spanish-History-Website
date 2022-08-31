
<script>
import { RouterLink } from 'vue-router'
// https://vuejsexamples.com/vue2-and-vue3-directive-for-keyboard-navigation-roving-movement-and-trapping-inside-container/
export default {
  name: "Navigation",
  data() {
    return {
      menuActive: false,
      logo: {
        url: "src/assets/coas/House_of_Barcelona.svg",
        altsText: "Logo"
      },
      menuItem: [
        { name: "Family" , link:"/family" },
        { name: "Map" , link:"/map" },
        { name: "About" , link:"/about" },
        { name: "Home", link:"/home" },
      ],
    };
  },
  methods: {
    menu() {
      if (this.menuActive === false) {
        this.menuActive = true;
      } else if (this.menuActive === true) {
        this.menuActive = false;
      }
    }
  }
};
</script>

<template>
  <nav class="navigation">
    <section class="logo-container">
        <img class="logo" :src="logo.url" :alt="logo.altText">
        <div class="logo-text">The Iberia Project</div>
    </section>

    <section :class="{active: menuActive}" class="menu-item-container">
      <div class="menu">
        <div v-for="item in menuItem" :key="item.id" class="menu-item">
          <RouterLink :to=item.link>
            <a>{{item.name}}</a>
          </RouterLink>
        </div>
      </div>
    </section>
  </nav>
</template>

<style >
.navigation {
	 display: flex;
	 background-color: white;
	 height: 4em;
   border-bottom: .1em solid gray;
}
.logo-container {
	 display: flex;
	 padding: 0.7rem;
}
.logo {
	 display: inline-block;
	 height: 100%;
	 object-fit: contain;
}
.logo-text {
  object-fit: contain;
   font-size:1.25em;
  padding-left:1em;
  padding-right:1em;
}

.menu-item-container {
	 display: flex;
	 margin-left: auto;
	 align-items: center;
	 overflow: hidden;
}
.menu-item-container.active {
	 display: flex;
	 position: fixed;
	 top: 4rem;
	 z-index: 1;
	 background: white;
	 height: 100%;
	 width: 100%;
}

.menu {
   flex-grow: 2;
   right:0;
	 display: flex;
	 height: 100%;
}

.menu-item {
  height:100%;
  width: 100%;
}
a {
  width:100%;
  height:100%;
  display: flex;
  align-items: center;
  text-decoration: none;
  color: black;
  transition: all 0.2s ease-out;
  font-size: 2 em;
  justify-content: center;
}

a:hover {
	 background-color:lightsalmon;
	 color: white;
   text-decoration: none;
}

</style>
