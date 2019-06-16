class Task < ApplicationRecord
  validates :user_id, presence: true
  validate :planned_finished_at_cannot_be_in_the_past
  
  def planned_finished_at_cannot_be_in_the_past
    if planned_finished_at.present? && planned_finished_at < Date.today
      errors.add(:planned_finished_at, ": 過去の日付は使えません")
    end
  end
  
  
  belongs_to :user
  
  enum priority: { low: 1, high: 2 }
  enum status: { undo: 1, doing: 2, finished: 3 }
 class << self
   def search(query)
    rel = order("id")
    if query.present?
     rel = rel.where("title LIKE ?" , "%#{query}%")
    else
     rel.all
    end
   end
 end
end