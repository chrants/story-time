class PublicController < ApplicationController
    
    def index
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
    def founding_members; end
end
