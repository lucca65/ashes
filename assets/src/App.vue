<template>
  <div class="ui container">
    <h1 class="ui header">Titulo: {{title}}</h1>
    <div class="ui primary button">title</div>
    <input v-model="title" type="text" />
  </div>
</template>

<script>
export default {
  name: 'app',
  data() {
    return {
    title: 'From vue!'
    }
  }
}
</script>
