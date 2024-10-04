// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract Todo{
    struct TodoItem {
        string title;
        string description;
        bool isDone;
    }

    TodoItem[] todos;

    event TodoCreated();
    event todoUpdated(uint256 indexed index);

    function createTodo(string memory _title,string memory _description) external {
        // todos.push(TodoItem(_title,_description, false));
        // first method

        // todos.push(TodoItem({
        //     title:_title,
        //     description:_description,
        //     isDone:false
        // }));
        // second method

        TodoItem memory td;

        td.title = _title;
        td.description = _description;
        todos.push(td);

        emit TodoCreated();

    }


    //get the whole array list of todos
    function getTodos() external view returns (TodoItem[] memory) {
        return todos;
    }


    //get one of the task from the todos
    function getTodo(uint256 _index) external view returns(TodoItem memory){
        require(_index < todos.length,"index cannit be found");
        return todos[_index];
    }

    function toggleStatus(uint256 _index) external{
        TodoItem storage td = todos[_index]; 
        //create an instance "td" , point it at the index of the array we are looking for

        td.isDone = !td.isDone; //use that instance to update the status

        emit todoUpdated(_index);

    }
    //get all the Todo items
    //get one of the Todo Item
}