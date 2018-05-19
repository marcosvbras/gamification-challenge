Rails.application.config.after_initialize do
  require 'filewatcher'

  Thread.new do
    Filewatcher.new('csv/*.csv').watch do |filename, event|
      if(event == :changed)
        puts "File updated: " + filename
      end
      if(event == :deleted)
        puts "File deleted: " + filename
      end
      if(event == :created)
        puts "Added file: " + filename
      end
    end
  end

end
