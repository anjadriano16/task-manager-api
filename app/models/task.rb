class Task < ApplicationRecord
  belongs_to :category
  belongs_to :user, foreign_key: "assigned_to", optional: true
  validates :title, :due_date, presence: true

  after_create_commit { broadcast_task }
  after_update_commit { broadcast_task }

  def self.send_due_reminders
    where("due_date <= ? AND completed = ?", 1.day.from_now, false).each do |task|
      TaskMailer.reminder_email(task).deliver_now
    end
  end

  private

  def broadcast_task
    ActionCable.server.broadcast("task_updates", self)
  end
end
