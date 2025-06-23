class HomeController < ApplicationController
  before_action :authenticate_user!

  # def index
  #   @todo = Todo.new
  #   @username = current_user.email.split('@').first.capitalize

  #   @todos =
  #     case params[:filter]
  #     when 'completed'
  #       current_user.todos.where(status: 'completed').order(created_at: :desc)
  #     when 'pending'
  #       current_user.todos.where(status: 'pending').order(created_at: :desc)
  #     else
  #       current_user.todos.order(created_at: :desc)
  #     end
  # end
  def index
  @todo = Todo.new
  @username = current_user.email.split('@').first.capitalize

  todos = current_user.todos.order(created_at: :desc)

  # Filter by month
  month_filter = params[:month] || 'this'
  if month_filter == 'this'
    todos = todos.where(created_at: Time.current.beginning_of_month..Time.current.end_of_month)
  elsif month_filter == 'past'
    todos = todos.where('created_at < ?', Time.current.beginning_of_month)
  end

  # Filter by status
  status_filter = params[:filter]
  if status_filter == 'pending'
    todos = todos.where(status: 'pending')
  elsif status_filter == 'completed'
    todos = todos.where(status: 'completed')
  end

  @todos = todos
end

end
