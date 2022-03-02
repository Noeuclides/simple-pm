# == Schema Information
#
# Table name: projects
#
#  id          :integer          not null, primary key
#  description :text
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  owner_id    :integer
#  team_id     :integer          not null
#
# Indexes
#
#  index_projects_on_owner_id  (owner_id)
#  index_projects_on_team_id   (team_id)
#
# Foreign Keys
#
#  owner_id  (owner_id => users.id)
#  team_id   (team_id => teams.id)
#
FactoryBot.define do
  factory :project do
    sequence(:name) { |n| "Categoria #{n}" }
    description { Faker::Lorem.sentence }
  end
end
