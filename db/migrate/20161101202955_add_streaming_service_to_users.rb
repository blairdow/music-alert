class AddStreamingServiceToUsers < ActiveRecord::Migration
  def change
    add_column :users, :streaming_service_url, :string
  end
end
