class AddAddressToTeachers < ActiveRecord::Migration[7.1]
  def change
    add_column :teachers, :address, :string
  end
end
