class DailyCash < ApplicationRecord
  validates :from, :to, :reason, :money, :with_draw_date, presence: true
end
