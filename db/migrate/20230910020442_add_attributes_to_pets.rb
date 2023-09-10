class AddAttributesToPets < ActiveRecord::Migration[7.0]
    def change
      add_column :pets, :gender, :string
      add_column :pets, :color, :string
      add_column :pets, :date_of_birth, :date
      add_column :pets, :health_score, :integer
      add_column :pets, :personality_traits, :string
      add_column :pets, :pet_status, :string
      add_column :pets, :bio, :string
      add_column :pets, :weight, :float
    end
  end
  