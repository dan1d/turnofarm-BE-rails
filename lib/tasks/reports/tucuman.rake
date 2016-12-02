namespace :reports do
  namespace :create do
    desc "Pulls data for tucuman"
    task :tucuman, [:date] => [:environment] do |t, args|
      puts "*" * 25
      puts "> Starting TUCUMAN REPORT! #{args.first}"
      date =  args.first or Date.today
      Scrapper::DataPuller.new(date).save
      puts "> TUCUMAN REPORT SAVED"
    end
  end

end
