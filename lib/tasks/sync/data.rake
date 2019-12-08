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

    response = Net::HTTP.get(URI(API_URL))
    data = JSON.parse(response)
    data['teams'].each do |team|
      Team.find_or_initialize_by(id: team['id'])
          .update_attributes!(permitted_attributes(team))
    end
  end

  def permitted_attributes(team)
    attributes = {}
    TEAM_PERMITTED_ATTRIBUTES.each do |key|
      attributes[key] = team[key]
    end
    attributes
  end
end
