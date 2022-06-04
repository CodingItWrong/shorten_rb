class CreateLinks < ActiveRecord::Migration[7.0]
  def change
    create_table :links do |t|
      t.string :slug, null: false
      t.string :destination, null: false
      t.string :domain, null: true

      t.timestamps
    end

    add_index :links, [:domain, :slug], unique: true
  end
end
