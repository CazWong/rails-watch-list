class Movie < ApplicationRecord
  validates :title, uniqueness: true, presence: true
  validates :overview, uniqueness: true, presence: true
  has_many :lists, through: :bookmarks
  has_many :bookmarks
end
