class Auction < ActiveRecord::Base


  belongs_to :user

  has_many :bids, dependent: :destroy


  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { greater_than: 5 }



include AASM

aasm whiny_transitions: false do
  state :draft, initial: true
  state :published

  event :publish do
    transitions from: :draft, to: :published
    end
  end


  def self.published
    where(aasm_state: :published)
  end


end
