class CreateCatagoryCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :catagory_courses do |t|
      t.references :course, null: false, foreign_key: true
      t.references :catagory, null: false, foreign_key: true

      t.timestamps
    end
  end
end
