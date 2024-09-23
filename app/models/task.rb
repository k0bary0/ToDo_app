class Task < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :description, presence: true, length: { minimum: 10 }
  validates :user_id, presence: true
end
