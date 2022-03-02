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

class Project < ApplicationRecord
  belongs_to :owner, class_name: User.name, dependent: :destroy
  belongs_to :team, dependent: :destroy
  has_many :tasks, dependent: :destroy

  after_create_commit :notify_recipient

  private

  def notify_recipient
    ProjectNotification.with(project: self).deliver(team.members)
  end

  def status
    return 'not_started' if tasks.none?
    if tasks.all? { |task| task.complete? }
      'complete'
    elsif tasks.any? { |task| task.in_progress? || task.complete? }
      'in_progress'
    else
      'not_started'
    end
  end

  def percent_complete
    return 0 if tasks.none?
    (total_complete.to_f / total_tasks * 100).round
  end

  def total_complete
    tasks.select { |task| task.complete? }.count
  end

  def total_tasks
    tasks.count
  end
end
