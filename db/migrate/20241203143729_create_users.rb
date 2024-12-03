class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false, default: ""
      t.string :encrypted_password, null: false, default: ""
      t.string :profile_image
      t.text   :introduction

      t.timestamps
    end

    # インデックスを追加
    add_index :users, :email, unique: true
  end
end
