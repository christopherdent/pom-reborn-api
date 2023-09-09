# app/models/pet.rb
class Pet < ApplicationRecord
    belongs_to :user
    validates :name, presence: true
    validates :species, presence: true
    validates :user, presence: true # Validate the presence of a user association

  end
  


