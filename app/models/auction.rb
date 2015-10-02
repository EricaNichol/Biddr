class Auction < ActiveRecord::Base

  belongs_to :user

  has_many :bids, dependent: :destroy


  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { greater_than: 5 }

end
