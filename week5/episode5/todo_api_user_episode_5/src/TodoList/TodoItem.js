import React from "react";
import Grid from "@material-ui/core/Grid"
import Paper from "@material-ui/core/Paper"
import { makeStyles } from "@material-ui/core/styles"
import Button from "@material-ui/core/Button"
import DeleteIcon from "@material-ui/icons/Delete"
import { Typography } from "@material-ui/core";

const useStyles = makeStyles({
    root: {
        height: "auto",
        margin: "1em",
        padding: "2em",
    },
    divider: {
        width: "25%",
        margin: "1em"
    },
    paper: {
        margin: "1em",
        padding: "2em",
        textAlign: "justify"
    },
    heading: {
        textAlign: "center"
    },
    todo_body: {
        padding: "1em"
    }
})

export default function TodoItem(props) {
    const classes = useStyles();
    function handleDelete() {
        props.deleteItem(props.item)
    }
    return (
        <Grid container spacing={0}>
            <Grid item xs={1}></Grid>
            <Grid item xs={10}>
                <Paper elevation={10} className={classes.paper}>
                    <Typography variant="h4" className={classes.heading}>
                        {props.item.task}
                    </Typography>
                    <hr className={classes.divider} style={{ marginLeft: "37.5%" }} />
                    <div className={classes.todo_budy}>
                        <Typography variant="body1">
                            {props.item.body}
                        </Typography>
                    </div>
                    <hr className={classes.divider} />
                    <Button
                        variant="contained"
                        color="secondary"
                        size="small"
                        startIcon={<DeleteIcon />}
                        onClick={handleDelete}>
                        Delete
                    </Button>
                </Paper>
            </Grid>
        </Grid>
    )
}