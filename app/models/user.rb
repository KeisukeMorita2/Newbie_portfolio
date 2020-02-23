class User < ApplicationRecord
  before_save { self.email.downcase! }
  validates :name, presence: true, length: { maximum: 20 }
  validates :email, presence: true, length: { maximum: 100 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false}
  has_secure_password

  has_many :favorites, dependent: :destroy
  has_many :questions, dependent: :destroy
  has_many :likes, through: :favorites, source: :question
  has_many :relationships, dependent: :destroy
  has_many :followings, through: :relationships, source: :follow
  has_many :reverses_of_relationship, class_name: 'Relationship', foreign_key: 'follow_id'
  has_many :followers, through: :reverses_of_relationship, source: :user
  has_one_attached :avatar

  def follow(other_user)
    unless self == other_user
      self.relationships.find_or_create_by(follow_id: other_user.id)
    end
  end

  def unfollow(other_user)
    relationship = self.relationships.find_by(follow_id: other_user.id)
    relationship.destroy if relationship
  end

  def following?(other_user)
    self.followings.include?(other_user)
  end

  def favorite(question)
    favorites.find_or_create_by(question_id: question.id)
  end

  def unfavorite(question)
    favorite = favorites.find_by(question_id: question.id)
    favorite.destroy if favorite
  end

  def like?(question)
    self.likes.include?(question)
  end
end
