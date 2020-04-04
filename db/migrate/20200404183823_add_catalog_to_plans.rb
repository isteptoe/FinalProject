class AddCatalogToPlans < ActiveRecord::Migration[6.0]
  def change
    add_reference :plans, :catalog, foreign_key: true
  end
end
