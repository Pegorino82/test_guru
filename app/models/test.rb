# frozen_string_literal: true

class Test < ApplicationRecord
  def self.by_category(title)
    category = Category.where(title: title).first
    where(category_id: category.id).order(title: :DESC).all
  end
end
