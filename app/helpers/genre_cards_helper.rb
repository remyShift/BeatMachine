module GenreCardsHelper
  def genre_cards
    @genres = {
      rap: "red",
      rock: "blue",
      jazz: "green"
    }

    @genres.each do |genre|
      render "shared/template_card", genre: genre, color: @genres[genre]
    end
  end
end
