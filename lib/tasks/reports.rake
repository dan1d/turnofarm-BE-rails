namespace :reports do
  desc "Create Reports for a given date"
  task :create => [:environment] do
    puts "*" * 50
    puts "> Starting reports"
    Rake::Task["reports:create:tucuman"].invoke
  end

end
