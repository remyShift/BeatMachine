require 'json'

class DrumracksController < ApplicationController
  skip_before_action :authenticate_user!
  skip_before_action :verify_authenticity_token
  before_action :set_drumrack, only: [:show, :soundbox, :update, :duplicate]

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
    @samples_from_drumrack = @drumrack.samples.each_with_object({}) do |sample, hash|
      hash[sample.category] = sample.sound.url
    end.to_json
  end

  def duplicate
    duplicated_drumrack = @drumrack.dup
    duplicated_drumrack_samples = []
    @drumrack.samples.each do |sample|
      duplicated_drumrack_sample = DrumrackSample.create(sample: sample, drumrack: duplicated_drumrack)
      duplicated_drumrack_samples << duplicated_drumrack_sample
    end
    duplicated_drumrack.pads.each_with_index do |pad, pad_index|
      duplicated_drumrack_samples.each_with_index do |drumrack_sample, i|
        active = @drumrack.pads[pad_index].pad_drumrack_samples[i].active
        PadDrumrackSample.create(pad: pad, drumrack_sample: drumrack_sample, active: active)
      end
    end
    duplicated_drumrack.save
    redirect_to soundbox_drumrack_path(duplicated_drumrack)
  end

  def edit
    @drumrack = Drumrack.find(params[:id])
  end

  def update
    data = JSON.parse(params[:drumrack][:pads])
  
    @drumrack.update(name: params[:drumrack][:name], user: current_user)
  
    data.each_with_index do |pad_json, index|
      pad = @drumrack.pads[index]
      next unless pad
  
      pad.pad_drumrack_samples.each do |pad_drumrack_sample|
        pad_sample_json = pad_json.is_a?(Array) ? pad_json.find { |l| l["category"] == pad_drumrack_sample.sample.category } : nil
        
        if pad_sample_json
          pad_drumrack_sample.update(active: pad_sample_json["active"])
        else
          Rails.logger.warn "Aucune correspondance trouvée pour la catégorie #{pad_drumrack_sample.sample.category}"
        end
      end
    end

    respond_to do |format|
      format.json { render json: { status: 'ok' } }
      format.html { redirect_to soundbox_drumrack_path(@drumrack) }
    end
  end

  def templates
    @templates = Drumrack.all
  end

  private

  def set_drumrack
    @drumrack = Drumrack.find(params[:id])
  end

  def drumrack_params
    params.require(:drumrack).permit(:name, :pads)
  end
end
