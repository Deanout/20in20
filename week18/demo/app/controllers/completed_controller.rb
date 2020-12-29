class CompletedController < ApplicationController
  def update
    @todo = Todo.find(params[:id])
    @todo.completed = !@todo.completed

    respond_to do |format|
      if @todo.save
        format.html { redirect_to todos_url, notice: 'Todo was successfully updated.' }
        format.json { render :show, status: :ok, location: @todo }
      else
        format.html { render :edit }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
  end
end
