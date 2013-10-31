class CreateLeaveMessages < ActiveRecord::Migration
  def change
    create_table :leave_messages do |t|
      t.integer :user_id
      t.text :message
      t.integer :parent_id
      t.boolean :reply_flag

      t.timestamps
    end
  end
end
