class AddUrlToMaterial < ActiveRecord::Migration[5.1]
  def change
    add_column :materials, :url_link, :string
  end
end
