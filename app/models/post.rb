class Post < ApplicationRecord
    #アソシエーション(1:多)
    belongs_to :user
    
    is_impressionable counter_cache: true
    
    mount_uploader :image, ImageUploader
    has_many :likes, dependent: :destroy
    has_many :liked_users, through: :likes, source: :user
    has_many :comments, dependent: :destroy
    validates :title, presence: true 
    validates :time, presence: true 
    validates :genre, presence: true 
end
