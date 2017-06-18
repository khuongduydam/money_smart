class DailyCash < ApplicationRecord
  validates :from, :to, :reason, :money, :with_draw_date, presence: true

  def self.output_money
    pluck(:money).inject(&:+).nil? ? 0 : pluck(:money).inject(&:+)
  end

  def find_month(date)
    if date.size < 10
      date.scan(/\w+/).first
    else
      date.scan(/\w+/).second
    end
  end
end
