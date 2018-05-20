class ScoreService

  def process(params)
    # Searching for the total user score
    result = Score.where(uid:params[:uid]).group('uid').sum(:points)
    sum = if result.any? then result[params[:uid]] else 0 end
    total = sum + params[:points]

    if total < Score::MAX_PONTUATION
      Score.create(params).valid?
    elsif sum < Score::MAX_PONTUATION
      params[:points] = Score::MAX_PONTUATION - sum
      Score.create(params).valid?
    end
  end

end
