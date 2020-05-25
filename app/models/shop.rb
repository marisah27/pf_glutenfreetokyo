class Shop < ApplicationRecord
  belongs_to :user
  
  validates :name, presence: true, length: { maximum: 50 }
  validates :address, length: { maximum: 100 }
  validates :review, presence: true, length: { maximum: 300 }
  
  enum area: {
    ginza: 0,
    sinbashi: 1,
    shibuya: 2,
    shinjuku: 3,
    ikebukuro: 4,
    others: 5
  }
  
  enum genre: {
    italian: 0,
    washoku: 1,
    ethnic: 2,
    meet: 3,
    cafe: 4
  }
  
end
