require 'JSON'

class DrumracksController < ApplicationController
  skip_before_action :authenticate_user!
  skip_before_action :verify_authenticity_token
  before_action :set_drumrack, only: [:show, :soundbox, :update]

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
    @samples_from_drumrack = @drumrack.samples.each_with_object({}) do |sample, hash|
      hash[sample.category] = sample.sound.url
    end.to_json
  end

  def show
  end

  def update
    data = params['pads'].map do |pad|
      JSON.parse(pad)
    end

    data.each_with_index do |pad_json, index|
      pad = @drumrack.pads[index]
      pad.pad_drumrack_samples.each do |pad_drumrack_sample|
        pad_sample_json = pad_json.select{ |l| l["category"] == pad_drumrack_sample.sample.category}.first
        pad_drumrack_sample.update(active: pad_sample_json["active"])
      end
    end

    respond_to do |format|
      format.json do
        { status: 'ok' }
      end
    end
  end

  private

  def set_drumrack
    @drumrack = Drumrack.find(params[:id])
  end

  def drumrack_params
    params.require(:drumrack).permit(:pads)
  end
end
