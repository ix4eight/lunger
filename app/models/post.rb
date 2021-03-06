class Post < ApplicationRecord
  belongs_to :user
  belongs_to :language

  has_many :images, dependent: :destroy
  has_many :comments
  
  accepts_nested_attributes_for :images, allow_destroy: true

  validates :title,    presence: true
  validates :text,    presence: true
  validates :images, presence: true
  validates_associated :images
end
