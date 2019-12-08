# rubocop:disable Metrics/BlockLength
namespace :sync do
  desc 'Sync data'
  task data: :environment do
    API_URL = 'https://fantasy.premierleague.com/api/bootstrap-static/'.freeze
    TEAM_PERMITTED_ATTRIBUTES = %w[
      code
      name
      short_name
      strength
      strength_attack_away
      strength_attack_home
      strength_defence_away
      strength_defence_home
      strength_overall_away
      strength_overall_home
      unavailable
    ].freeze

    PLAYER_TYPE_PERMITTED_ATTRIBUTES = %w[
      plural_name
      plural_name_short
      singular_name
      singular_name_short
    ].freeze

    PLAYER_PERMITTED_ATTRIBUTES = %w[
      assists
      bonus
      bps
      chance_of_playing_next_round
      chance_of_playing_this_round
      clean_sheets
      code
      creativity
      goals_scored
      goals_conceded
      ep_next
      ep_this
      event_points
      first_name
      form
      ict_index
      inflience
      minutes
      now_cost
      photo
      points_per_game
      second_name
      selected_by_percent
      status
      threat
      total_points
      web_name
    ].freeze

    response = Net::HTTP.get(URI(API_URL))
    data = JSON.parse(response)

    data['teams'].each do |team|
      Team.find_or_initialize_by(id: team['id'])
          .update_attributes!(permitted_attributes(team, :team))
    end

    data['element_types'].each do |player_type|
      PlayerType.find_or_initialize_by(id: player_type['id'])
                .update_attributes!(permitted_attributes(player_type, :player_type))
    end

    data['elements'].each do |player|
      Player.find_or_initialize_by(id: player['id'])
            .update_attributes!(permitted_attributes(player, :player))
    end
  end

  def permitted_attributes(data, model)
    attributes = {}
    case model
    when :team
      TEAM_PERMITTED_ATTRIBUTES.each do |key|
        attributes[key] = data[key]
      end
    when :player_type
      PLAYER_TYPE_PERMITTED_ATTRIBUTES.each do |key|
        attributes[key] = data[key]
      end
    when :player
      PLAYER_PERMITTED_ATTRIBUTES.each do |key|
        attributes[key] = data[key]
      end
      attributes['player_type_id'] = data['element_type']
      attributes['team_id'] = data['team']
    end
    attributes
  end
end
# rubocop:enable Metrics/BlockLength
