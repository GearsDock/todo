class Task < ApplicationRecord
  enum priority: { low: 1, high: 2 }
  enum status: { undo: 1, doing: 2, finished: 3 }
  class << self
   def search(query)
    rel = order("id")
    
     if query == "undo"
      query = 1
      categoly = status_categoly
     elsif query == "doing"
      query = 2
      categoly = status_categoly
     elsif query == "finished"
      query = 3
      categoly = status_categoly
     elsif query == "low"
      query = 1
      categoly = priority_categolye
     elsif query == "high"
      query = 2
      categoly = priority_categoly
     end 
     
     unless query.nil?
      case categoly
      when  status_categoly
       rel = rel.where(status: query)
      when priority_categoly
       rel = rel.where(priority: query)
      else
       rel = rel.where(“title LIKE ?“, “%#{query}%“)
      end
     end
   end
  end
end


