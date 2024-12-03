module GenreCardsHelper
  def color_card(drumrack)
    case drumrack.genre
    when "reggaeton"
      "bg-gradient-to-r from-primary to-yelloww"
    when "jerseyclub"
      "bg-greyy"
    when "pop"
      "bg-gradient-to-r from-blue-500 to-blue-300"
      when "bailefunk"
      "bg-gradient-to-r from-blue-300 to-emerald-900"
    when "trap"
      "bg-gradient-to-r from-emerald-900 to-emerald-700"
    when "jazz"
      "bg-gradient-to-r from-emerald-700 to-green-500"
    when "jungle"
      "bg-gradient-to-r from-green-500 to-green-300"
    when "techno"
      "bg-gradient-to-r from-green-700 to-green-400"
    else
      "bg-gray-500"
    end
  end
end
