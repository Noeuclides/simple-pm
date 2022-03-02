# == Schema Information
#
# Table name: user_teams
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  team_id    :integer          not null
#  user_id    :integer          not null
#
# Indexes
#
#  index_user_teams_on_team_id  (team_id)
#  index_user_teams_on_user_id  (user_id)
#
# Foreign Keys
#
#  team_id  (team_id => teams.id)
#  user_id  (user_id => users.id)
#
FactoryBot.define do
  factory :user_team do
    user { nil }
    team { nil }
  end
end
