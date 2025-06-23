class TodosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_todo, only: [:update, :destroy]

  def index
  @todos = current_user.todos
end

  def index
    case params[:filter]
    when 'completed'
      @todos = current_user.todos.where(status: 'completed')
    when 'pending'
      @todos = current_user.todos.where(status: 'pending')
    else
      @todos = current_user.todos
    end
  end

  def create
    @todo = current_user.todos.build(todo_params)
    if @todo.save
      redirect_to root_path, notice: "Todo added!"
    else
      redirect_to root_path, alert: "Failed to add todo."
    end
  end

  def update
    if @todo.update(todo_params)
      redirect_to root_path, notice: "Todo updated."
    else
      redirect_to root_path, alert: "Update failed."
    end
  end

  def destroy
    @todo.destroy
    redirect_to root_path, notice: "Todo deleted."
  end

  private

  def set_todo
    @todo = current_user.todos.find(params[:id])
  end

  def todo_params
    params.require(:todo).permit(:title, :status)
  end
end
