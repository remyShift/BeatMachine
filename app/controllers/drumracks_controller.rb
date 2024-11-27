class DrumracksController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_drumrack, only: [:show]

  def index
    @drumracks = Drumrack.all
    @music_cards = [
      { title: "Groove with me", tags: ["105 bpm", "Rap", "Drill"] },
      { title: "Chill Vibes", tags: ["90 bpm", "Jazz", "Relax"] },
      { title: "Party Beats", tags: ["120 bpm", "Dance", "EDM"] },
      { title: "Party Beats", tags: ["120 bpm", "Dance", "EDM"] },
      { title: "Party Beats", tags: ["120 bpm", "Dance", "EDM"] },
      { title: "reagae  Vibes", tags: ["120 bpm", "Jazz", "xRelax"] }
    ]
  end

  def soundbox
    @drumrack = Drumrack.find(params[:id])
  end

  def show
  end

  private

  def set_drumrack
    @drumrack = Drumrack.find(params[:id])
  end
end
