class BasePoint < ApplicationRecord
  validates :base_point_name, presence: true, length: { maximum: 10 },
                    uniqueness: true
  validates :time_classification, presence: true, length: { maximum: 10 }
end
