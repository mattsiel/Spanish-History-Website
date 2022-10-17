<script setup>
import { useLocationStore } from '../stores/location.js'

const local = useLocationStore();
// style="margin: 50px 0; padding: 35px; border: 1px solid rgba(var(--accent-color-rgb), 0.5);; border-radius: 3px;"

</script>

<template>
    <div id="sidebar">
        <h2 v-text=local.printName() ></h2>
        <div id="sidebar-title" class="text-box">
                <p>
                Replace the content of the <code>body</code> tag. In addition to
                what's made available in this code (<code>index.html</code>), you
                can use any other resource (fonts, images, icons libraries, etc.)
                to help you build the design of the landing page.
                </p>
        </div>
    </div>
</template>


<style>
@import '@/assets/base.css';

#sidebar {
    text-align: center;
    padding: 1vw;
    background-color: var(--background-color);
    right:0%;
    width:30.5vw;
    position:absolute;
    display: flex;
    flex-direction: column;
}


</style>
