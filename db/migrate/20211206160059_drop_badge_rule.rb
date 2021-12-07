class DropBadgeRule < ActiveRecord::Migration[6.1]
  def change
    remove_reference :badges, :badge_rule, index: true, foreign_key: true
    drop_table :badge_rules
  end
end
