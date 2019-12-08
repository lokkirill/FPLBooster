class Player < ApplicationRecord
  belongs_to :player_type
  belongs_to :team
end
