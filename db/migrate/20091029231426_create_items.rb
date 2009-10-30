class CreateItems < ActiveRecord::Migration
  def self.up
    create_table :items do |t|
      t.column :description, :string, :limit => 255
      t.column :purchase_cost, :float
      t.column :purchase_date, :datetime
      t.column :location_id, :integer
      t.column :category_id, :integer
      
      t.timestamps
    end
  end

  def self.down
    drop_table :items
  end
end
