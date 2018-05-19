Rails.application.config.after_initialize do
  require 'filewatcher'
  require 'csv'

  Thread.new do
    Filewatcher.new('csv/*.csv').watch do |filename, event|
      if(event != :deleted)
        puts "File updated: " + filename

        # CSV.foreach(filename, headers:false) do |row|
        #   puts row
        # end

        CSV.foreach(filename, :headers => true, :col_sep => ';') do |row|
          Score.create(date: row['date'], username: row['username'],
            uid: row['uid'], points: row['points']
          )
        end
      end
    end
  end

end
