class Event < ApplicationRecord
  belongs_to :user
  belongs_to :bar
  has_one_attached :photo


  validates :date, presence: true
  validates :name, presence: true
  validates :bar_comment, presence: true
end
