class CreateNames < ActiveRecord::Migration
  def change
    create_table :names do |t|
      t.string :name
      t.text :short
      t.text :description
      t.boolean :male, default: false
      t.boolean :female, default: false

      t.timestamps null: false
    end
  end
end
