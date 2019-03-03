class Badge < ApplicationRecord
  RULES = {
    'Успешное прохождение всех тестов категории' => :category,
    'Успеiное прохождение всех тестов уровня' => :level,
    'Кол-во пыпыток для успешного прохождения теста' => :attempt
  }

  has_many :users_badges, dependent: :destroy
  has_many :users, through: :users_badges, dependent: :destroy

end
