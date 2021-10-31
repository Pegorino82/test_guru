# frozen_string_literal: true

module TestsHelper
  LEVELS = { (0..2) => :easy, (2..4) => :middle, (5..) => :hard }.freeze

  def test_level(test)
    LEVELS.detect { |level, _| level.include?(test.level) }.last
  end
end
