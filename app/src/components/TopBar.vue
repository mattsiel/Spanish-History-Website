<script setup>
    import TopBarItem from './TopBarItem.vue';
    import { RouterLink, RouterView } from 'vue-router';
</script>

<template>
    <div id="topbar" >
            <RouterLink to="/home" class="topbarbox" >
                <TopBarItem>
                    <template #heading>Home</template>
                </TopBarItem>
            </RouterLink>

            <RouterLink to="/maps" class="topbarbox" >
                <TopBarItem>
                    <template #heading>Maps</template>
                </TopBarItem>
            </RouterLink>

             <TopBarItem>
                    <template #heading>The Iberia Project</template>
            </TopBarItem>

            <RouterLink to="/families" class="topbarbox" >
                <TopBarItem>
                    <template #heading>Families</template>
                </TopBarItem>
            </RouterLink>

            <RouterLink to="/about" class="topbarbox" >
                <TopBarItem>
                    <template #heading>About</template>
                </TopBarItem>
            </RouterLink>
    </div>
</template>


<style>
#topbar {
    top:0rem;
    background-color: bisque;
    height:4rem;
    width:100%;
    overflow:hidden;
    position:sticky;
    display: flex;
}

.topbarbox{
    height:100%;
    width:30%;
    justify-content: center;
    display:flex;
    text-decoration: none;
}

</style>
