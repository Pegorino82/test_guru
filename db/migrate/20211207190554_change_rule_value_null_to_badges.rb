class ChangeRuleValueNullToBadges < ActiveRecord::Migration[6.1]
  def change
    change_column_null :badges, :rule_value, true
  end
end
