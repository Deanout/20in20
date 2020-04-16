import React, { Component } from "react"
import TextField from '@material-ui/core/TextField'
import Button from '@material-ui/core/Button'
import Grid from "@material-ui/core/Grid"
import TextareaAutosize from "@material-ui/core/TextareaAutosize"

class TodoForm extends Component {
    constructor(props) {
        super(props)
        this.state = {
            api_url: props.api_url,
            task: "",
        }
        this.handleSubmit = this.handleSubmit.bind(this);
        this.handleTaskChange = this.handleTaskChange.bind(this);
    }

    handleSubmit(event) {
        event.preventDefault();
        this.formSubmit(event.target);
    }

    async formSubmit(formData) {
        var data = new FormData(formData);
        await fetch(this.state.api_url, {
            method: "POST",
            mode: "cors",
            body: data
        }).then(response => response.json())
            .then(response => this.props.updateTodoList(response))
    }

    handleTaskChange(event) {
        this.setState({
            task: event.target.value
        })
    }

    render() {
        return (
            <Grid container>
                <Grid item xs></Grid>
                <Grid item xs={10}>
                    <form
                        onSubmit={this.handleSubmit}
                        id="todo_form"
                        autoComplete="off">
                        <Grid container>
                            <Grid item xs={12}>
                                <TextField
                                    id="task_input"
                                    label="Task Description"
                                    variant="outlined"
                                    type="text"
                                    name="todo[task]"
                                    onChange={this.handleTaskChange}
                                    fullWidth />
                            </Grid>
                            <Grid item xs={12}>
                                <TextareaAutosize
                                    id="body_input"
                                    label="Task Body"
                                    variant="outlined"
                                    type="text"
                                    style={{ width: "99%", borderRadius: "5px" }}
                                    rowsMin={3}
                                    placeholder="Describe your todo item..."
                                    name="todo[body]"></TextareaAutosize>
                            </Grid>
                            <Grid item xs={2}>
                                <Button variant="contained"
                                    color="primary"
                                    type="submit"
                                    style={{ height: "100%" }}>Add Task</Button>
                            </Grid>
                        </Grid>
                    </form>
                </Grid>
                <Grid item xs></Grid>
            </Grid>
        )
    }
}
export default TodoForm;