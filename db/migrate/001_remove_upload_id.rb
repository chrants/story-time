require 'dm-migrations/migration_runner'

DataMapper::Logger.new(STDOUT, :debug)
DataMapper.logger.debug( "Starting Migration" )

migration 1, :remove_upload_id do

  down do
  	modify_table :server_files do
  		remove_column :upload_id
  	end
  end

end