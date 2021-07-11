class Link < ApplicationRecord
    validates_presence_of :destination
    validates_uniqueness_of :destination
    
    def short
        self.id
        #Rails.application.routes.url_helpers.tiny_url(token: self.id)
    end
end
