class AddRuleAndRuleValueToBadge < ActiveRecord::Migration[6.1]
  def change
    add_column :badges, :rule, :string, null: false
    add_column :badges, :rule_value, :string, null: false
  end
end
