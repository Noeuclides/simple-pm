# frozen_string_literal: true

class StatusReflex < ApplicationReflex
  def change
    task = Task.find(element.dataset[:id])
    task.update(status: element[:value].to_i)
  end

end
