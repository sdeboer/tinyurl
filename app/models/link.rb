class Link < ApplicationRecord
    has_many :hits, dependent: :delete_all
    validates_presence_of :destination
    validates_uniqueness_of :destination
    
    def short
        self.class.id_to_short self.id
    end
    
    def short_url
        Rails.application.routes.url_helpers.tiny_url(token: self.short, only_path: true)
    end
    
    # This is a simple transform to make the obfucated external
    # ID.  Depending on non-functional requirements this could be
    # an encrypted, hashed, or some other form of external identifier.
    
    ID_OFFSET = 1212 # Just to move the numbers up a little.
    def self.id_to_short(plain)
        (plain + ID_OFFSET).to_s 36
    end
    
    def self.short_to_id(base36)
        (base36.to_i(36)) - ID_OFFSET
    end
end
