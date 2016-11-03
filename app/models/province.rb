class Province < ApplicationRecord
  has_many :cities
  has_many :reports
end
