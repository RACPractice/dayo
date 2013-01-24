class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      t.string :name
      t.string :subject
      t.string :from_email
      t.string :from_name
      t.string :reply_to
      t.string :html_url
      t.string :text_url
      t.integer :user_id

      t.timestamps
    end
  end
end
