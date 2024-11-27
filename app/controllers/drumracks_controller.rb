class DrumracksController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_drumrack, only: [:show]

  def index
    @drumracks = Drumrack.all
  end

  def soundbox
    @drumrack = Drumrack.find(params[:id])
    @samples_from_drumrack = @drumrack.samples.each_with_object({}) do |sample, hash|
      hash[sample.category] = sample.sound.url
    end.to_json
  end

  def show
  end

  private

  def set_drumrack
    @drumrack = Drumrack.find(params[:id])
  end
end
