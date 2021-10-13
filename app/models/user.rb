# frozen_string_literal: true

class User < ApplicationRecord
  # ищем среди авторов, т.к. пока у теста нет проходивших его пользователей
  def tests_by_level(level)
    Test.where(author_id: id, level: level).all
  end
end
