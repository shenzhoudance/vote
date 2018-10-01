class Topic < ApplicationRecord
  has_many :newvotes, dependent: :destroy
end
