import { createStore } from "vuex";
import todos from "@/store/modules/todos";

export default createStore({
  modules: {
    todos
  }
});
