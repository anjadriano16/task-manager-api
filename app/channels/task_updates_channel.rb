class TaskUpdatesChannel < ApplicationCable::Channel
  def subscribed
    stream_from "task_updates"
  end
end
