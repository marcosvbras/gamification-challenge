class ScoresController < ApplicationController

  def index
    @scores = Score.select("username, uid, sum(points) as points").group("uid").order("sum(points) DESC")
  end

  def show
    @score = Score.find(params[:id])
  end

end
