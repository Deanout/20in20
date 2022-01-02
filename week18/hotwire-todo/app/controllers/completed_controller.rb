class CompletedController < ApplicationController
  def update
    @todo = Todo.find(params[:id])
    @todo.completed = !@todo.completed
    @todo.save
    # if we don't type respond, we get the 406 error code. 
    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.replace(@todo) }
      format.html         { redirect_to todos_url }
    end
  end
end
