class Planet < ApplicationRecord
    has_many :characters, dependent: :destroy
    
end
