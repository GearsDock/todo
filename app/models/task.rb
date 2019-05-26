class Task < ApplicationRecord
  enum priority: { low: 1, high: 2 }
  enum status: { undo: 1, doing: 2, finished: 3  }
end
