class DrumracksController < ApplicationController
  def index
    @drumpads = Drumpad.all
  end
end
