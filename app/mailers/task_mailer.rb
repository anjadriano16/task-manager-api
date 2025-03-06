class TaskMailer < ApplicationMailer
  default from: "angelicajem.1608@gmail.com"

  def reminder_email(task)
    @task = task
    @user = task.user
    mail(to: @user.email, subject: "Reminder: Task Due Soon")
  end
end
