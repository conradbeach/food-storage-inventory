class User < ApplicationRecord
  include Clearance::User

  has_many :storage_types, dependent: :restrict_with_exception
end
