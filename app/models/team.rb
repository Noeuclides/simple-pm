# == Schema Information
#
# Table name: teams
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Team < ApplicationRecord
  has_many :projects, dependent: :destroy
  has_many :user_teams, dependent: :destroy
  has_many :members, through: :user_teams, source: :user
end
