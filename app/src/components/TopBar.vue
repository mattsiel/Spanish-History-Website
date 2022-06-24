<script setup>
    import TopBarItem from './TopBarItem.vue';
    import { RouterLink, RouterView } from 'vue-router';
</script>

<template>
    <div id="topbar" >
            <RouterLink to="" class="topbarbox" >
                <TopBarItem>
                    <template #heading>Home</template>
                </TopBarItem>
            </RouterLink>

            <RouterLink to="" class="topbarbox" >
                <TopBarItem>
                    <template #heading>Home</template>
                </TopBarItem>
            </RouterLink>

            <RouterLink to="" class="topbarbox" >
                <TopBarItem>
                    <template #heading>Home</template>
                </TopBarItem>
            </RouterLink>

            <RouterLink to="" class="topbarbox" >
                <TopBarItem>
                    <template #heading>Home</template>
                </TopBarItem>
            </RouterLink>

            <RouterLink to="" class="topbarbox" >
                <TopBarItem>
                    <template #heading>Home</template>
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
    background-color: aquamarine;
    height:100%;
    width:20%;
    justify-content: center;
    display:flex;
    text-decoration: none;
    border: 5px solid blue;
}

</style>
