class Post < ApplicationRecord
  
  # PostモデルはUserモデルに属する
  belongs_to :user
  
  # PostモデルにPost_commentモデルを関連付ける    
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  #titleとcontentが存在しているかを確認するバリデーション
  validates :title, presence: true
  validates :content, presence: true
  
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
  
end
