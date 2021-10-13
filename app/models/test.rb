# frozen_string_literal: true

class Test < ApplicationRecord
  def self.by_category(title)
    joins('JOIN categories ON tests.category_id = categories.id')
      .where(categories: { title: title })
      .order(title: :DESC).all
  end
end
