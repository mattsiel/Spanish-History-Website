<script>

export default {
  name: "App",
};

console.log('looking at home!');
</script>

<template>
    <div id="homeView">
        <h1>this is Header 1</h1>
        <h2>this is Header 2</h2>
        <h3>this is Header 3</h3>
        <p> this is a paragrah</p>
        <ul>
            <li>this is a list item</li>
        </ul>
        <a>this is a link</a>
        <btn class="btn">this is a button</btn>

        <div class="text-box">
            <p>Lorem Ipsum is simply dummy text of the printing and types
                etting industry. Lorem Ipsum has been the industry's standard 
                dummy text ever since the 1500s, when an unknown printer took a
                 galley of type and scrambled it to make a type specimen book. It 
                 has survived not only five centuries, but also the leap into elect
                 ronic typesetting, remaining essentially unchanged. It was popularised 
                 in the 1960s with the release of Letraset sheets containing Lorem Ipsum p
                 assages, and more recently with desktop publishing software like Aldus PageMaker 
                 including versions of Lorem Ipsum.</p>
        </div>
        <div class="text-box-alt">
            <p>Lorem Ipsum is simply dummy text of the printing and types
                etting industry. Lorem Ipsum has been the industry's standard 
                dummy text ever since the 1500s, when an unknown printer took a
                 galley of type and scrambled it to make a type specimen book. It 
                 has survived not only five centuries, but also the leap into elect
                 ronic typesetting, remaining essentially unchanged. It was popularised 
                 in the 1960s with the release of Letraset sheets containing Lorem Ipsum p
                 assages, and more recently with desktop publishing software like Aldus PageMaker 
                 including versions of Lorem Ipsum.</p>
        </div>
    </div>

</template>

<style>
@import '@/assets/base.css';

#homeView {
    left:100px;
    top:100px;
}
</style>
