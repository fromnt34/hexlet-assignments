# frozen_string_literal: true

class Task < ApplicationRecord
  belongs_to :user
  belongs_to :status

  validates :name, :user, :status, presence: true
end
