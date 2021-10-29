# frozen_string_literal: true

module TestsHelper
  LEVELS = { (0..2) => :easy, (2..4) => :middle, (5..) => :hard }.freeze

  def test_level(test)
    LEVELS.each do |level, text|
      return text if level.include?(test.level)
    end
  end
end
