class CreateScheduledMessages < ActiveRecord::Migration
  def change
    # create_table :scheduled_messages do |t|
    #
    #   t.timestamps
    # end
    
    create_table :scheduled_messages do |t|
      t.integer :plan_id, null: false
      t.timestamp :send_at, null: false
      t.text :body, null: false
      t.text :from_phone_number, null: false
      t.boolean :active, null: false
      t.timestamps
    end
    
    add_index :scheduled_messages, :plan_id
  end
end
