class Shop < ApplicationRecord
  belongs_to :user
  
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
