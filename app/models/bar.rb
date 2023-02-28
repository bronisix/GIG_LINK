class Bar < ApplicationRecord
  belongs_to :user
  has_many :events, dependent: :destroy
  has_one_attached :photo


  validates :name, presence: true
  validates :location, presence: true, uniqueness: true
end
