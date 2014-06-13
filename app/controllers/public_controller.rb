class PublicController < ApplicationController
    
    def index
        if Upload
            @uploads = Upload.all(limit: 3)#topics:, limit: 3)
            @uploads = Upload.all(limit: 3) unless @uploads.get(0)
        end
    end
    def mission; end
    def subjects; end
    def programs; end
    def about; end
    def contact; end
    
    def send_contact 
        PublicMailer.contact_email(params).deliver
        redirect_to '/'
    end

    def testimonies; end
    def plans; end
    def pricing; end
    def terms; end
    def founding_members
      @founding_members = BetaMember.all confirmed: true
    end
end
