class Clone < ApplicationRecord
  validates :contents,  presence: true,length:{ maximum: 140 }
end
