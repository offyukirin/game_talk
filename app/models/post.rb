class Post < ApplicationRecord

  # PostモデルはUserモデルに属する
  belongs_to :user

  # PostモデルにPost_commentモデルを関連付ける
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  #続いてtagモデルとpostモデルにそれぞれを関連づける設定
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags

  #titleとcontentが存在しているかを確認するバリデーション
  validates :title, presence: true
  validates :content, presence: true

  # 検索方法分岐
  def self.looks(search, word)
    if search == "perfect_match"
      @post = Post.where("title LIKE?","#{word}")
    elsif search == "forward_match"
      @post = Post.where("title LIKE?","#{word}%")
    elsif search == "backward_match"
      @post = Post.where("title LIKE?","%#{word}")
    elsif search == "partial_match"
      @post = Post.where("title LIKE?","%#{word}%")
    else
      @post = Post.all
    end
  end

  def favorited_by?(user_id)
    favorites.exists?(user_id: user.id)
  end

end
