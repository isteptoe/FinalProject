class CreateMajors < ActiveRecord::Migration[6.0]
  def change
    create_table :majors do |t|
      t.string :major

      t.timestamps
    end
  end
end
