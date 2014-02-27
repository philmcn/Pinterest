class AddVotingToPins < ActiveRecord::Migration
  def change
    add_column :pins, :voting, :integer, :default => 0
  end
end
