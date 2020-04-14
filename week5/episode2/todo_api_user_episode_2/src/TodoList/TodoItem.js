import React from "react";

export default function TodoItem(props) {
    return (
        <li>{props.item.task}</li>
    )
}