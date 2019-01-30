class TodosController < ApplicationController
  before_action :set_todo, only: [:show, :edit, :update, :destroy, :complete]
  def index
    @todos = Todo.all 
  end

  def new
    @todo = Todo.new
  end

  def create
    todo = Todo.new(todo_params)
    todo.save 
    redirect_to root_path 
  end

  def show
  end

  def edit 
  end

  def update
    @todo.update(todo_params)
    redirect_to root_path, notice: 'Se Actualizo Todo!'
  end

  def destroy
    @todo.destroy
    redirect_to root_path, notice: 'Se elimino Todo!'
  end

  def complete
    @todo.completed = true
    @todo.save
    redirect_to root_path, notice: 'Todo completado!'
  end

  def list
    @todos_not = Todo.where(completed: false)
    @todos = Todo.where(completed: true)
  end

  private

  def set_todo
    @todo = Todo.find(params[:id]) 
  end

  def todo_params
    params.require(:todo).permit(:description, :completed)
  end
  
end
