<script>
    import TopBarItem from './TopBarItem.vue';
</script>

<template>
    <div id="topbar">

        <div id="banner">
            The Iberia Project
        </div>

        <TopBarItem title="Home" router="/home"/>
        <TopBarItem title="Map" router="/map"/>
        <TopBarItem title="Families" router="/family"/>
        <TopBarItem title="About" router="/about"/>
    </div>
</template>


<style>
#banner {
    flex-grow: 5;
    height:100%;
    text-align: center;
    display:inline-block;
}



#topbar {
    position: relative;
    width: 100vw;
    height: 4em;
    background: #F2F2F2;
}

</style>
