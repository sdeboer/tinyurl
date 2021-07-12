class Hit < ApplicationRecord
    belongs_to :link
    
    validates_presence_of :address
end
