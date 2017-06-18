class InputMoney < ApplicationRecord

  def self.input_money
    pluck(:money).inject(&:+)
  end

  def find_month(date)
    if date.size < 10
      date.scan(/\w+/).first
    else
      date.scan(/\w+/).second
    end
  end
end
