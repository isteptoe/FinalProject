class CreateCatalogs < ActiveRecord::Migration[6.0]
  def change
    create_table :catalogs do |t|
      t.integer :catalogYear

      t.timestamps
    end
  end
end
