namespace :db do
    desc 'Run automigrate! and seed on the database.'
    task :recreate do
        if system 'rake db:automigrate db:seed'
            exec 'echo Success!'
        else
            exec 'echo Failure!'
        end
    end
=begin
    task :seed do
    	if Seed
    		Seed::seed_all()
    	else
    		Dir::chdir(Rails.root)
    		require_relative('db/seed.rb')
    		Seed::seed_all()
    	end
    end
    namespace :seed do
    	task :all do
    		if Seed
	    		Seed::seed_all()
	    	else
	    		Dir::chdir(Rails.root)
	    		require_relative('db/seed.rb')
	    		Seed::seed_all()
	    	end
    	end
    	task :uploadtypes do
    		Dir::chdir(Rails.root.to_s)
    		puts "echo #{Dir::pwd()}"
	    	puts require('db/seed.rb')
	    	Seed::seed_upload_types()
    	end
    	task :schools do
    		if Seed
	    		Seed::seed_schools()
	    	else
	    		Dir::chdir(Rails.root)
	    		require_relative('db/seed.rb')
	    		Seed::seed_schools()
	    	end
    	end
    	task :uploads do
    		if Seed
	    		Seed::seed_uploads()
	    	else
	    		Dir::chdir(Rails.root)
	    		require_relative('db/seed.rb')
	    		Seed::seed_uploads()
	    	end
	    end
    end
=end
end