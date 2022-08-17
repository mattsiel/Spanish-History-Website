<script setup>
import { useLocationStore } from '../stores/location.js'

const local = useLocationStore();

</script>

<template>
    <div id="sidebar">
        <div style="margin: 50px 0; padding: 35px; border: 1px solid rgba(var(--accent-color-rgb), 0.5);; border-radius: 3px;"
            >
                <h3 style="margin: 0; color: var(--accent-color)" v-text=local.printName() ></h3>
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
#sidebar {
    text-align: center;
    align-items: center;
    padding: 1vw;
    top:0rem;
    background-color: white;
    height:100vh;
    right:0%;
    width:19.5vw;
    overflow:hidden;
    position:absolute;
    display: flex;
}

</style>
