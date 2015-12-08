class TodoItem < ActiveRecord::Base
  belongs_to :todo_list
  validates_presence_of :todo_item

  def completed?
 !completed_at.blank?
  end


end
