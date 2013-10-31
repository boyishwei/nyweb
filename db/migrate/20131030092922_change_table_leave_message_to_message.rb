class ChangeTableLeaveMessageToMessage < ActiveRecord::Migration
  def up
	rename_table :leave_messages, :messages
  end

  def down
	rename_table :messages, :leave_messages
  end
end
