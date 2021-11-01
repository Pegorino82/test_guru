class AddCurrentQuestionToResults < ActiveRecord::Migration[6.1]
  def change
    add_reference :results, :current_question, foreign_key: { to_table: :questions }
    change_column_default :results, :score, from: nil, to: 0
  end
end
