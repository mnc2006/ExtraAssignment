class TodoItemsController < ApplicationController
before_action :set_todo_list
before_action :set_todo_item, except: [:create, :new, :index]


  def index
    @todo_item = TodoItem.all
  end

  def create
    @todo_item = @todo_list.todo_item.create(todo_item_params)
    @todo_item.save!
    redirect_to @todo_list
  end

  def destroy
    if @todo_item.destroy
      flash[:success] = "Todo list item was deleted."
    else
      flash[:error] = "Todo list item could not be deleted."
    end
    redirect_to @todo_list
  end

  def complete
    @todo_item.update_attribute(:completed_at, Time.now)
    redirect_to @todo_list, notice: "Todo item completed."
  end

  private

  def set_todo_list
    @todo_list = TodoList.find(params[:todo_list_id])
  end

  def set_todo_item
    @todo_item = @todo_list.todo_items.find(params[:id])
  end


  def todo_item_params
    params[:todo_item].permit(:content)
  end


end
