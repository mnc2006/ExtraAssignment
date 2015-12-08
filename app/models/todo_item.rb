class TodoItem < ActiveRecord::Base
  belongs_to :todo_list
  validates_presence_of :item 

  def completed?
 !completed_at.blank?
  end


end
