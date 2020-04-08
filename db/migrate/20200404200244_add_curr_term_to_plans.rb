class AddCurrTermToPlans < ActiveRecord::Migration[6.0]
  def change
    add_column :plans, :currTerm, :string
  end
end
