class Product < ApplicationRecord
    mount_uploader :image_address, ImageUploader
end
