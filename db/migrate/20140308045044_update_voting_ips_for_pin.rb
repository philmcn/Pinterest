class UpdateVotingIpsForPin < ActiveRecord::Migration
  def up
    Pin.update_all({voting_ips:[].to_json},{})
  end

  def down
  end
end
