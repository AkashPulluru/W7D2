class Band < ApplicationRecord
    validates :name, uniqueness: true, presence: true 
    # before_validation :set_band
     

    # def set_band 
    #     @band = Band.find_by(band_params)
    # end 

    # has_many :albums,
    # class_name 'Album',
    # foreign_key :album_id,
    # dependent: :destroy

end 