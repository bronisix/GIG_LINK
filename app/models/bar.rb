class Bar < ApplicationRecord
  has_many :events, dependent: :destroy
  belongs_to :user

  validates :name, uniqueness: true, presence: true
  validates :location, presence: true
end
