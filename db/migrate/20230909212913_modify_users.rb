# db/migrate/YYYYMMDDHHMMSS_modify_users.rb
class ModifyUsers < ActiveRecord::Migration[7.0]
  def change
    # Remove the 'username' column
    remove_column :users, :username

    # Add 'first_name' and 'last_name' columns
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string

    # Add relationships
    add_reference :pets, :user, foreign_key: true
    # Add other relationships as needed

    # Add constraints and validations
    change_column_null :users, :first_name, false
    change_column_null :users, :last_name, false
    add_index :users, :email, unique: true
    validate_password_length
  end

  def validate_password_length
    User.all.each do |user|
      if user.password.length < 5 || user.password.length > 55
        raise "Password length is not within the valid range for user #{user.id}"
      end
    end
  end
end
