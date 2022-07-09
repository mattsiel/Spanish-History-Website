<template>
    <div>
        <div id="on"
             @click="switched(true)"
             :class="{active: value}">On
        </div>
        <div id="off"
             @click="switched(false)"
             :class="{active: !value}">Off
        </div>
    </div>
</template>

<script>
    export default {
        props: ['value'],
        methods: {
            switched(isOn) {
                this.$emit('input', isOn);
            }
        }
    }
</script>

<style>
    #on, #off {
        width: 45px;
        height: 25px;
        background-color: lightgray;
        padding: 4px;
        display: inline-block;
        margin: 11px -3px;
        box-sizing: content-box;
        cursor: pointer;
        text-align: center;
    }

    #on:hover, #on.active {
        background-color: #77ee79;
    }

    #off:hover, #off.active {
        background-color: #f08e8d;
    }
</style>