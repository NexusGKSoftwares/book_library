class LendingHistory < ApplicationRecord
  belongs_to :book

  validates :borrower_name, presence: true
  validate :returned_at_after_borrowed_at

  def returned_at_after_borrowed_at
    if returned_at.present? && borrowed_at.present? && returned_at < borrowed_at
      errors.add(:returned_at, "cannot be before borrowed date")
    end
  end
end
