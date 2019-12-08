class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.integer :assists
      t.integer :bonus
      t.integer :bps
      t.integer :chance_of_playing_next_round
      t.integer :chance_of_playing_this_round
      t.integer :clean_sheets
      t.integer :code
      t.string :creativity
      t.integer :goals_scored
      t.integer :goals_conceded
      t.references :player_type
      t.string :ep_next
      t.string :ep_this
      t.integer :event_points
      t.string :first_name
      t.string :form
      t.string :ict_index
      t.string :inflience
      t.integer :minutes
      t.integer :now_cost
      t.string :photo
      t.string :points_per_game
      t.string :second_name
      t.string :selected_by_percent
      t.string :status
      t.references :team
      t.string :threat
      t.integer :total_points
      t.string :web_name

      t.timestamps
    end
  end
end
