class AdminController < ApplicationController

  before_filter 'check_credentials(:admin)'

  def feed

  end

  def flags
  	@flags = Flag.all(order: [ :created_at.desc ])
  end

  def uploads
  	@uploads = Upload.all(order: [ :created_at.desc ])
  end

  def pending_uploads
  	# Get all minus accepted ones.
  	@uploads = Upload.all(order: [ :created_at.desc ]) - Upload.all(approved: true)
  end
  
  ## Delete, update, etc. attempt upload#destroy, upload#update, upload#etc...
end
