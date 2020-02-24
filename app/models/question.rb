# frozen_string_literal: true

class Question < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :title, presence: true, length: { maximum: 255 }, uniqueness: true
  validates :content, presence: true, length: { maximum: 255 }
  validates :answer, presence: true, length: { maximum: 255 }

  has_many :favorites, dependent: :destroy
  has_many :users, through: :favorites

  def self.ransackable_attributes(_auth_object = nil)
    %w[title content answer]
  end

  def self.ransackable_associations(_auth_object = nil)
    []
  end
end
