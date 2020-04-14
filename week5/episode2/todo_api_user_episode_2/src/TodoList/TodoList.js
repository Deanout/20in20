import React, { Component } from "react"
import TodoForm from "./TodoForm"
import TodoItem from "./TodoItem"

const api_url = `http://localhost:3001/api/v1/todos`

class TodoList extends Component {
    constructor(props) {
        super(props)

        this.state = {
            items: []
        }
        this.updateTodoList = this.updateTodoList.bind(this);
    }
    componentDidMount() {
        this.getTasks();

    }

    getTasks() {
        fetch(api_url)
            .then(response => response.json())
            .then(response_items => {
                this.setState({
                    items: response_items.reverse()
                })
            });
    }

    updateTodoList(item) {
        let _items = this.state.items
        _items.unshift(item)
        this.setState({
            items: _items
        })
    }

    render() {
        console.log(this.state.items)
        return (
            <div>
                <TodoForm api_url={api_url} updateTodoList={this.updateTodoList} />
                <ul id="todo_list">
                    {this.state.items.map((item) => (
                        <TodoItem key={item.id} item={item} />
                    ))}
                </ul>
            </div>
        )
    }
}
export default TodoList;