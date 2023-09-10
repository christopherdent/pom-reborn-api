# app/models/pet.rb
class Pet < ApplicationRecord
    belongs_to :user
    validates :name, presence: true
    validates :species, presence: true
    validates :user, presence: true # Validate the presence of a user association
    validates :age, numericality: { greater_than: -1 }
    validates :weight, numericality: { greater_than: -1 }
    validates :gender, presence: true
    validates :bio, length: { maximum: 500 }
    validates :color, presence: true
    validates :date_of_birth, presence: true
    validates :health_score, presence: true
    validates :personality_traits, presence: true
    validates :pet_status, presence: true
    scope :by_species, -> (species) { where(species: species) }


  end
  


