class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.integer :code
      t.string :name
      t.string :short_name
      t.integer :strength
      t.integer :strength_attack_away
      t.integer :strength_attack_home
      t.integer :strength_defence_away
      t.integer :strength_defence_home
      t.integer :strength_overall_away
      t.integer :strength_overall_home
      t.boolean :unavailable

      t.timestamps
    end
  end
end
