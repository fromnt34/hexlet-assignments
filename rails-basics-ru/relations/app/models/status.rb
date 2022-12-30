# frozen_string_literal: true

class Status < ApplicationRecord
  # BEGIN
  has_many :task, dependent: :destroy
  # END
end
