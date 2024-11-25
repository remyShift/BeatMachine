class DrumracksController < ApplicationController
  before_action :skip_authorization

  def index
    @drumracks = Drumrack.all
  end
end
