class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      t.string :name
      t.date :start_date
      t.date :end_date
      t.float :media_budget
      t.float :media_spent
      t.integer :impressions
      t.integer :clicks
      t.integer :ctr
      t.integer :conversions
      t.float :ecpm
      t.float :ecpc
      t.float :ecpa
      t.integer :campaign_id

      t.timestamps null: false
    end

    add_index :campaigns, [:campaign_id], :name => "campaign_id_index"
  end
end
