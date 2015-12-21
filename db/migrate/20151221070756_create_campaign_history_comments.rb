class CreateCampaignHistoryComments < ActiveRecord::Migration
  def change
    create_table :campaign_history_comments do |t|
      t.integer :campaign_id
      t.integer :api_campaign_id
      t.string :comment

      t.timestamps null: false
    end
    add_index :campaign_history_comments, [:campaign_id], :name => "campaign_id_index"
    add_index :campaign_history_comments, [:api_campaign_id], :name => "api_campaign_id_index"
  end
end
