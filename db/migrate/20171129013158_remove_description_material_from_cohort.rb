class RemoveDescriptionMaterialFromCohort < ActiveRecord::Migration[5.1]
  def change
    remove_column :cohorts, :description, :string
    remove_column :cohorts, :material, :string
    remove_column :cohorts, :title, :string
  end
end
