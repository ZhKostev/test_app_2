class CreateCreatives < ActiveRecord::Migration
  def change
    create_table :creatives do |t|
      t.integer :campaign_id
      t.integer :api_creative_id
      t.string :name
      t.integer :impressions
      t.integer :clicks
      t.integer :ctr
      t.integer :conversions
      t.float :ecpm
      t.float :ecpc
      t.float :ecpa

      t.timestamps null: false
    end
    add_index :creatives, [:campaign_id], :name => "campaign_id_index"
    add_index :creatives, [:api_creative_id], :name => "api_creative_id_index"
  end
end
