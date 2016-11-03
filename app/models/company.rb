class Company < ApplicationRecord
  has_many :addresses
  has_many :report_companies
end
