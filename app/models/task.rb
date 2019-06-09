class Task < ApplicationRecord
  validates :user_id, presence: true
  belongs_to :user
  enum priority: { low: 1, high: 2 }
  enum status: { undo: 1, doing: 2, finished: 3 }
 class << self
   def search(query)
    rel = order("id")
    if query.present?
     rel = rel.where("title LIKE ?" , "%#{query}%")
    end
   end
 end
end