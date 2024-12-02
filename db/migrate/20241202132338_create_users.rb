class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      name
      t.string :name,         null: false
      t.string :email,        null: false, unique: true
      t.string :password,     null: false
      t.string :profile_image
      t.text   :introduction

      t.timestamps
    end
  end
end
