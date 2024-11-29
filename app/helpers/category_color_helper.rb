module CategoryColorHelper
  def category_color(category)
    case category
    when "kick"
      "bg-red-gradient"
    when "snare"
      "bg-green-gradient"
    when "hihat"
      "bg-blue-gradient"
    when "oneshot"
      "bg-yellow-gradient"
    when "bass"
      "bg-purple-gradient"
    else
      ""
    end
  end
end
