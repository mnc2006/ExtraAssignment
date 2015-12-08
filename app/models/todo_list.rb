class TodoList < ActiveRecord::Base

  has_many :todo_items
  belongs_to :user
  validates_presence_of :title

end
