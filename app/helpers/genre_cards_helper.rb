module GenreCardsHelper
  def color_card(drumrack)
    case drumrack.genre
    when "reggeaton"
      "bg-gradient-to-tr from-blue-700 to-blue-400"
    when "jazz"
      "bg-gradient-to-tr from-pink-700 to-pink-400"
    when "jersey club"
      "bg-gradient-to-tr from-yellow-700 to-yellow-400"
    when "pop"
      "bg-gradient-to-tr from-blue-400 to-emerald-400"
    when "baile funk"
      "bg-gradient-to-tr from-red-700 to-red-400"
    when "trap"
      "bg-gradient-to-tr from-purple-700 to-purple-400"
    when "dumb techno"
      "bg-gradient-to-tr from-green-700 to-green-400"
    else
      "bg-gray-500"
    end
  end
end
