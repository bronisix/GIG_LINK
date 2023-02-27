class Bar < ApplicationRecord
  belongs_to :user
  has_many :events

  validates :name, presence: true
  validates :location, presence: true, uniqueness: true
end
