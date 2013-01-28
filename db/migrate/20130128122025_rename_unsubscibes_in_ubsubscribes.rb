class RenameUnsubscibesInUbsubscribes < ActiveRecord::Migration
  def change
  	rename_table :unsubscibes, :unsubscribes
  end
end
