class Speech < ApplicationRecord
    validates :president_name, presence: true
    validates :country_age, presence: true
    validates :tagline, presence: true
    validates :content, presence: true

    mount_uploader :logo, LogoUploader
    
end
