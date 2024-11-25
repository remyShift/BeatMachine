class DrumracksController < ApplicationController
  before_action :skip_authorization
  before_action :set_drumrack, only: [:show]

  def index
    @drumracks = Drumrack.all
  end

  def show
  end

  private

  def set_drumrack
    @drumrack = Drumrack.find(params[:id])
  end

end
