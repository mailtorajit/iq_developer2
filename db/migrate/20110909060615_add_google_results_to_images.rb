class AddGoogleResultsToImages < ActiveRecord::Migration
  def self.up
    add_column :images, :google_result_1, :text
    add_column :images, :google_result_2, :text
    add_column :images, :google_result_3, :text
  end

  def self.down
    remove_column(:images, :google_result_1, :google_result_2, :google_result_3)
  end
end
