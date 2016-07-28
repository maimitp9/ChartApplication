class CompetitionResult < ActiveRecord::Base
  belongs_to :sporter
  belongs_to :competition
end
