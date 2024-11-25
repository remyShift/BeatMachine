class DrumracksController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_drumrack, only: [:show]
  has_many :pads

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
