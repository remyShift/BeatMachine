module CategoryColorHelper
  def category_color(category)
    case category
    when "kick"
      "bg-red-500"
    when "snare"
      "bg-green-500"
    when "hihat"
      "bg-blue-500"
    when "oneshot"
      "bg-yellow-500"
    when "bass"
      "bg-purple-500"
    else
      ""
    end
  end
end
