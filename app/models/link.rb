class Link < ApplicationRecord
    has_many :hits
    validates_presence_of :destination
    validates_uniqueness_of :destination
    
    def short
        self.id
    end
    
    def short_url
        Rails.application.routes.url_helpers.tiny_url(token: self.short, only_path: true)
    end
end
