<template>
    <div>
        <h3>Add Todo</h3>
        <div class="add">
            <form @submit="onSubmit">
                <input type="text" v-model="title" placeholder="Add Todo...">
                <input type="submit" value="Submit">
            </form>
        </div>
    </div>
</template>

<script>
import { mapActions } from 'vuex';
export default {
    name: 'AddTodo',
    data() {
        return {
            title: ""
        }
    },
    methods: {
        ...mapActions(['addTodo']),
        onSubmit(event) {
            event.preventDefault();
            this.addTodo(this.title);
            this.title = "";
        }
    }
}
</script>
<style scoped>
form {
    display: flex;
}
input[type="text"] {
    flex: 10;
    padding: 10px;
    border: 1px solid #ccc;
    outline: 0;
}
input[type="text"]:hover, input[type="text"]:focus {
    border: 1px solid #41b883;
}
input[type="submit"] {
    flex: 2;
    background: #41b883;
    color: #fff;
    border: 1px #41b883 solid;
    cursor: pointer;
}
input[type="submit"]:hover, input[type="submit"]:focus {
    background: #318b63
}
</style>