class Bar < ApplicationRecord
  belongs_to :user
  has_many :events, dependent: :destroy
  has_one_attached :photo

  validates :name, presence: true
  validates :url, presence: true
end
