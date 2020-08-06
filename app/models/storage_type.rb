# frozen_string_literal: true

class StorageType < ApplicationRecord
  belongs_to :user

  has_many :categories, dependent: :restrict_with_exception
end
