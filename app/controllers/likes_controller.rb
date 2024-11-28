class LikesController < ApplicationController
  def create
    @drumrack = Drumrack.find(params[:drumrack_id])
    @like = Like.new(drumrack:@drumrack , user:current_user).save

    redirect_to root_path
  end

  def destroy
    @like = Like.destroy
end
