<template>
    <div>
        Filter Todos:
        <select @change="filterTodos($event)">
            <option value="200">200</option>
            <option value="200">100</option>
            <option value="200">50</option>
            <option value="200">25</option>
            <option value="200">10</option>
            <option value="200">5</option>
        </select>
    </div>
</template>
<script>
import { mapActions } from 'vuex'
export default {
    name: "FilterTodos",
    methods: mapActions(["filterTodos"])
}
</script>

<style scoped>
    select {
        margin-top: 20px;
        padding: 6px;
        border: #41b883;
    }
</style>