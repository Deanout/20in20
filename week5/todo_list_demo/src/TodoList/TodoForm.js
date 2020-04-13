import React, { Component } from 'react';
import { makeStyles } from '@material-ui/core/styles';
import TextField from '@material-ui/core/TextField';
import TextareaAutosize from '@material-ui/core/TextareaAutosize';
import Grid from "@material-ui/core/Grid"
import Button from "@material-ui/core/Button"


class TodoForm extends Component {
    constructor(props) {
        super(props);
        this.state = {
            api_url: props.api_url,
            task: "",
            body: "",
        }
        this.handleSubmit = this.handleSubmit.bind(this);
        this.handleTaskChange = this.handleTaskChange.bind(this);
    }

    handleSubmit(event) {
        event.preventDefault();
        this.formSubmit(event.target);
    }


    handleTaskChange(event) {
        this.setState({
            task: event.target.value
        })
    }

    async formSubmit(formData) {
        var data = new FormData(formData);
        var response = await fetch(this.state.api_url, {
            method: 'POST',
            mode: 'cors',
            body: data
        }).then(response => response.json()
            .then(response => this.props.updateTodoList(response)));

    }

    render() {
        return (

            <Grid container spacing={3}>
                <Grid item xs={12}>
                    <form
                        onSubmit={this.handleSubmit}
                        id="todo_form"
                        autoComplete="off">
                        <Grid item xs>
                            <TextField id="task_input" label="Task Name" variant="outlined" type="text" name="todo[task]" onChange={this.handleTaskChange} />
                        </Grid>
                        <Grid item xs>
                            <TextareaAutosize id="task_input" label="Outlined" variant="outlined" />
                        </Grid>
                        <Grid item xs>
                            <Button variant="contained" color="primary" type="submit">Submit</Button>
                        </Grid>
                    </form>
                </Grid>
            </Grid>
        );
    }
}

export default TodoForm;