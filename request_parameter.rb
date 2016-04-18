require "json"
require "date"

class RequestParameter
  PROJECT_ID     = ENV["PROJECT_ID"]
  TRACKER_ID     = ENV["TRACKER_ID"]
  STATUS_ID      = ENV["STATUS_ID"]
  PRIORITY_ID    = ENV["PRIORITY_ID"]
  ASSIGNED_TO_ID = ENV["ASSIGNED_TO_ID"]
  WDAYS = ["日", "月", "火", "水", "木", "金", "土"]

  attr_reader :params

  def initialize(from_date, to_date, reason)
    @from_date = from_date
    @to_date = to_date
    today = Date.today

    @params = {
      issue: {
        project_id: PROJECT_ID,
        tracker_id: TRACKER_ID,
        status_id: STATUS_ID,
        priority_id: PRIORITY_ID,
        assigned_to_id: ASSIGNED_TO_ID,
        subject: "PC持ち帰り #{today.month}/#{today.day}",
        description: "下記期間のPC持ち出しします。#{between}理由: #{reason}",
      }
    }
  end

  def between
    "\r\n\r\n#{formatted_from_date} 〜 #{formatted_to_date}\r\n\r\n"
  end

  def formatted_from_date
    "#{@from_date.month}/#{@from_date.day}(#{WDAYS[@from_date.wday]})"
  end

  def formatted_to_date
    "#{@to_date.month}/#{@to_date.day}(#{WDAYS[@from_date.wday]})"
  end
end
