module Admin::BadgesHelper
  def rules_collection
    Badge.rules.map {|val, _| [val, val, { data: {rule: val}}]}
  end
end
