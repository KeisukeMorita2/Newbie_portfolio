class Question < ApplicationRecord
  belongs_to :user
  
  validates :title, presence: true, length: { maximum: 255 }, uniqueness: true
  validates :content, presence: true, length: { maximum: 255 }
  validates :answer, presence: true, length: { maximum: 255 }

  has_many :favorites, dependent: :destroy
  has_many :users, through: :favorites

end
