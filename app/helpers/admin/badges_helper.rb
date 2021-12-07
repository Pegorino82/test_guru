module Admin::BadgesHelper

  def rules_collection
    Badge.rules.map {|val, _| [val, val, { data: {rule: val}}]}
  end

  def rule_title(badge)
    Badge.rules[badge.rule]
  end
end
