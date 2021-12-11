class CreateBadgeRule < ActiveRecord::Migration[6.1]
  def change
    create_table :badge_rules do |t|
      t.references :category, null: true , foreign_key: true
      t.string :level, null: true # test level: easy, medium, hard
      t.integer :amount, null: true
      t.boolean :all, null: true
      t.integer :attempts, null: true
      t.timestamps
    end
  end
end
