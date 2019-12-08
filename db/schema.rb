# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

# rubocop:disable Metrics/BlockLength
ActiveRecord::Schema.define(version: 20_191_208_212_247) do

  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'player_types', force: :cascade do |t|
    t.string 'plural_name'
    t.string 'plural_name_short'
    t.string 'singular_name'
    t.string 'singular_name_short'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'players', force: :cascade do |t|
    t.integer 'assists'
    t.integer 'bonus'
    t.integer 'bps'
    t.integer 'chance_of_playing_next_round'
    t.integer 'chance_of_playing_this_round'
    t.integer 'clean_sheets'
    t.integer 'code'
    t.string 'creativity'
    t.integer 'goals_scored'
    t.integer 'goals_conceded'
    t.integer 'player_type_id'
    t.string 'ep_next'
    t.string 'ep_this'
    t.integer 'event_points'
    t.string 'first_name'
    t.string 'form'
    t.string 'ict_index'
    t.string 'inflience'
    t.integer 'minutes'
    t.integer 'now_cost'
    t.string 'photo'
    t.string 'points_per_game'
    t.string 'second_name'
    t.string 'selected_by_percent'
    t.string 'status'
    t.integer 'team_id'
    t.string 'threat'
    t.integer 'total_points'
    t.string 'web_name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'teams', force: :cascade do |t|
    t.integer 'code'
    t.string 'name'
    t.string 'short_name'
    t.integer 'strength'
    t.integer 'strength_attack_away'
    t.integer 'strength_attack_home'
    t.integer 'strength_defence_away'
    t.integer 'strength_defence_home'
    t.integer 'strength_overall_away'
    t.integer 'strength_overall_home'
    t.boolean 'unavailable'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

end
# rubocop:enable Metrics/BlockLength
