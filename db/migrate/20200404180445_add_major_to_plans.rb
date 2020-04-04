class AddMajorToPlans < ActiveRecord::Migration[6.0]
  def change
    add_reference :plans, :major, foreign_key: true
  end
end
