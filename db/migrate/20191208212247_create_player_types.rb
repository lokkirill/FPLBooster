class CreatePlayerTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :player_types do |t|
      t.string :plural_name
      t.string :plural_name_short
      t.string :singular_name
      t.string :singular_name_short

      t.timestamps
    end
  end
end
