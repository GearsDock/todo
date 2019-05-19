class Task < ApplicationRecord
  enum priority: { 普: 1, 高: 2 }
  enum status: { 未着手: 1, 処理中: 2, 完了: 3  }
end
