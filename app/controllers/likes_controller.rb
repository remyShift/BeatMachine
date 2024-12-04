class LikesController < ApplicationController

  def new
    @drumrack = Drumrack.find(params[:drumrack_id])
    @like = Like.new
  end

  def create
    @drumrack = Drumrack.find(params[:drumrack_id])
    @like = Like.new(drumrack:@drumrack , user:current_user).save

    respond_to do |format|
      format.html {redirect_to root_path}
      # format.turbo_stream {}
    end
  end

  def destroy
    @like = Like.find(params[:id])
    @like.destroy
    redirect_to root_path
  end
end
