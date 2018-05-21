class ScoresController < ApplicationController

  def index
    @scores = Score.select("username, uid, sum(points) as points").group("uid").order("sum(points) DESC")
  end

  def list_by_user
    @scores = Score.where("uid":params[:uid]).order(date: :desc)
  end

end
