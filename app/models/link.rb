class Link < ApplicationRecord
    has_many :hits, dependent: :delete_all
    validates_presence_of :destination
    validates_uniqueness_of :destination
    
    # There could be HEAVY optimization here by caching the 
    # token -> destination into memcache or redis.  This is 
    # very easy in this case as you can write on change and 
    # then let a TTL, or just cache size, expire the unused
    # content.
    
    def token
        self.class.id_to_token self.id
    end
    
    def token_url
        Rails.application.routes.url_helpers.tiny_url(token: self.token, only_path: true)
    end
    
    # This is a simple transform to make the obfucated external
    # ID.  Depending on non-functional requirements this could be
    # an encrypted, hashed, or some other form of external identifier.
    
    ID_OFFSET = 1212 # Just to move the numbers up a little.
    def self.id_to_token(plain)
        (plain + ID_OFFSET).to_s 36
    end
    
    def self.token_to_id(base36)
        (base36.to_i(36)) - ID_OFFSET
    end
end
