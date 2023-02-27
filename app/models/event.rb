class Event < ApplicationRecord
  belongs_to :user
  belongs_to :bar

  validates :date, presence: true
  validates :name, presence: true
  validates :bar_comment, presence: true
end
