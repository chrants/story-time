module UploadsHelper
	def upload_content
		render file: '/uploads/_upload'
	end
end
