class AddTitleToBadgeRules < ActiveRecord::Migration[6.1]
  def change
    add_column :badge_rules, :title, :string, null: false
  end
end
