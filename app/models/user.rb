class User < ApplicationRecord
    has_many :pets
    validates :email, presence: true, uniqueness: true
    validates :password, length: { in: 5..55 }
    validates :first_name, presence: true
    validates :last_name, presence: true
    scope :admin, -> { where(admin: true) }
    scope :general, -> { where(admin: false) }
    validate :max_pets_per_user
    has_secure_password
  
  
    # def self.from_omniauth(auth)
    #     where(email: auth.info.email).first_or_initialize do |user|
    #       user.username = auth.info.name
    #       user.email = auth.info.email
    #       user.password = SecureRandom.hex
    #       user.first_name = auth.info.first_name
    #       user.last_name = auth.info.last_name
    #       #user.admin = false   #this was de-admining admins.  I've set a default to false in the schema instead.
    #     end
    #   end
  

      def full_name
        "#{self.last_name}, #{self.first_name}"
      end

      
  def max_pets_per_user
    # Count the number of pets associated with this user
    pet_count = pets.count

    # Set the maximum allowed pets per user
    max_pets = 3

    if pet_count >= max_pets
      errors.add(:base, "You can't have more than #{max_pets} pets.")
    end
  end
  
  end