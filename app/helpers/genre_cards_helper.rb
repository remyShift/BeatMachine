module GenreCardsHelper
  def color_card(drumrack)
    case drumrack.genre
    when "reggeaton"
      "bg-gradient-to-r from-blue-900 to-blue-700"
    when "jersey club"
      "bg-gradient-to-r from-blue-700 to-blue-500"
    when "pop"
      "bg-gradient-to-r from-blue-500 to-blue-300"
      when "baile funk"
      "bg-gradient-to-r from-blue-300 to-emerald-900"
    when "trap"
      "bg-gradient-to-r from-emerald-900 to-emerald-700"
    when "jazz"
      "bg-gradient-to-r from-emerald-700 to-green-500"
    when "dumb techno"
      "bg-gradient-to-r from-green-500 to-green-300"
    when "techno"
      "bg-gradient-to-r from-green-700 to-green-400"
    else
      "bg-gray-500"
    end
  end
end
