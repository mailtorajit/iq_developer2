class CreateImages < ActiveRecord::Migration
  def self.up
    create_table :images do |t|
      t.column :path, :string
      t.column :qid, :string
      t.column :result, :text
      t.timestamps
    end
  end

  def self.down
    drop_table :images
  end
end
