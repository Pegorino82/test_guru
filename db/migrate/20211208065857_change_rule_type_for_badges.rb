class ChangeRuleTypeForBadges < ActiveRecord::Migration[6.1]
  def change
    change_column :badges, :rule, :integer, using: 'rule::integer'
  end
end
