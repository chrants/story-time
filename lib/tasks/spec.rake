namespace :spec do
  desc "Pretty output documentation results."
  task :doc do
    system 'rspec spec --format documentation'
  end
end