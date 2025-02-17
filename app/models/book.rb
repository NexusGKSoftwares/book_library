class Book < ApplicationRecord
    has_many :lending_histories, dependent: :destroy
  
    validates :title, :author, :status, presence: true
    validates :status, inclusion: { in: %w[available borrowed] }
  end
  