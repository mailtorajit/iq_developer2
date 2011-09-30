class AddResponseToImage < ActiveRecord::Migration
  def self.up
    add_column :images, :response, :string
  end

  def self.down
    remove_column :images, :response
  end
end
