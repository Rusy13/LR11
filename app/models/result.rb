class Result < ApplicationRecord
  include ActiveModel::Serialization

  validate :number_must_be_greater_than_zero
  validates :input, format: { with: /\d/, message: 'должно быть числом' }
  after_validation :count_result

  def number_must_be_greater_than_zero
    if input <= 0
      errors.add(:expiration_date, "can't be less or equal zero")
    end

  def count_result
    self.result = (1..input).each.select { |num| if ((num**2) % (10**num.to_s.length)).to_s == num.to_s then num end }.map { |i| [i, i**2] }
    end
end
end