class CreateBadge < ActiveRecord::Migration[6.1]
  def change
    create_table :badges do |t|
      t.string :title, null: false
      t.string :path, null: false
      t.references :badge_rule, foreign_key: true

      t.timestamps
    end
  end
end
