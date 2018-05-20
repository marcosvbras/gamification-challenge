Rails.application.config.after_initialize do
  require 'filewatcher'
  require 'score_receptor_service'
  require 'csv'

  Thread.new do
    # Service class to process new score data
    service = ScoreService.new

    # Watching all .csv files in defined directory
    Filewatcher.new('csv/*.csv').watch do |filename, event|
      if(event != :deleted)
        CSV.foreach(filename, :headers => true, :col_sep => ';') do |row|
          params = {
            "date": row["date"], "username": row["username"],
            "uid": Integer(row["uid"]), "points": Integer(row["points"])
          }

          service.process(params)
        end
      end
    end
  end

end
