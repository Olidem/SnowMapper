class AddWebsiteUrlToResort < ActiveRecord::Migration[5.2]
  def change
    add_column :resorts, :website_url, :string
  end
end
