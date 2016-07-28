class Sporter < ActiveRecord::Base
  belongs_to :country
  has_many :competition_results
end
