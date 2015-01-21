class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.timestamp :start_time, null: false
      t.timestamp :end_time, null: false
      t.integer :booker_id, null: false
      t.integer :message_pattern_id
      t.integer :number_of_fake_women, null: false
      t.boolean :active
      t.timestamps
    end
    
    add_index :plans, :booker_id
    add_index :plans, :message_pattern_id
  end
end
