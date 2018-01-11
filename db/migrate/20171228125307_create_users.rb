class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|

      t.string :name
      t.string :email
      t.string :password
      t.string :username
      t.text   :address
      t.string :city
      t.string :country
      
      t.timestamps
    end
  end
end
