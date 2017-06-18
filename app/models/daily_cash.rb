class DailyCash < ApplicationRecord
  validates :from, :to, :with_draw_date, presence: true
  has_many :detail_outputs, inverse_of: :daily_cash, dependent: :destroy 
  accepts_nested_attributes_for :detail_outputs, reject_if: :all_blank, allow_destroy: true
  
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
