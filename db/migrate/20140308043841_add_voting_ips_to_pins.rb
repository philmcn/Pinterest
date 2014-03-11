class AddVotingIpsToPins < ActiveRecord::Migration
  def change
    add_column :pins, :voting_ips, :text
  end
end
