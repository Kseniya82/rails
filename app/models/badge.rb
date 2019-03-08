class Badge < ApplicationRecord
  RULES = %i[category level attempt].freeze

  has_many :users_badges, dependent: :destroy
  has_many :users, through: :users_badges, dependent: :destroy

  validates :title, :url, presence: true
end
