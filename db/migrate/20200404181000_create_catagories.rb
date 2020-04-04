class CreateCatagories < ActiveRecord::Migration[6.0]
  def change
    create_table :catagories do |t|
      t.references :requirement, null: false, foreign_key: true
      t.string :catagory

      t.timestamps
    end
  end
end
