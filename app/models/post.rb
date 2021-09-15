class Post < ApplicationRecord
    #アソシエーション(1:多)
    belongs_to :user

    
    mount_uploader :image, ImageUploader

    has_many :likes, dependent: :destroy
    has_many :liked_users, through: :likes, source: :user

    has_many :comments, dependent: :destroy

end
