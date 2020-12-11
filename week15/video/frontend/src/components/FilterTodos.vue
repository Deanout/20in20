<template>
    <div>
        Filter Todos:
        <select @change="filterTodos($event)">
            <option value="100">100</option>
            <option value="50">50</option>
            <option value="25">25</option>
            <option value="5">5</option>
        </select>
    </div>
</template>
<script>
import { mapActions } from 'vuex';
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