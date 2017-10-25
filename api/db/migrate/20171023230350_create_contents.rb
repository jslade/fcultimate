class CreateContents < ActiveRecord::Migration[5.1]
  def change
    create_table :contents do |t|

      t.timestamps

      t.string :name, unique: true
      t.text :body
      t.string :class_name
    end
  end
end
