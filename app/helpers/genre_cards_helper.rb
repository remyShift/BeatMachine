module GenreCardsHelper
  def color_card(drumrack)
    case drumrack.genre
    when "reggaeton"
      "bg-gradient-to-r from-primary to-yelloww"
    when "jerseyclub"
      "bg-gradient-to-r from-blue to-lightblue"
    when "pop"
      "bg-gradient-to-r from-pink to-orangee"
    when "bailefunk"
      "bg-gradient-to-r from-pink to-orangee"
    when "trap"
      "bg-gradient-to-r from-emerald-900 to-emerald-700"
    when "jazz"
      "bg-gradient-to-r from-emerald-700 to-green-500"
    when "jungle"
      "bg-gradient-to-r from-purple to-lightpurple"
    when "techno"
      "bg-gradient-to-r from-green-700 to-green-400"
    else
      "bg-gray-500"
    end
  end
end
