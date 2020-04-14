import React, { Component } from "react"
import TodoForm from "./TodoForm"

const api_url = `https://localhost:3001/api/v1/todos`

class TodoList extends Component {
    constructor(props) {
        super(props)

        this.state = {
            items: []
        }
    }

    render() {
        return (
            <div>
                <TodoForm />
                <ul>
                    <li>Todo #1</li>
                    <li>Todo #2</li>
                </ul>
            </div>
        )
    }
}
export default TodoList;