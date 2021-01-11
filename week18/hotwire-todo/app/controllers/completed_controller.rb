class CompletedController < ApplicationController
  def update
    @todo = Todo.find(params[:id])
    @todo.completed = !@todo.completed
    @todo.save
  end
end
