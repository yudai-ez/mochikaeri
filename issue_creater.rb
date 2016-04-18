require_relative "./request_parameter"
require_relative "./client"

while true
  print "from: 何月? "
  from_m = gets.to_i

  print "from: 何日? "
  from_d = gets.to_i

  print "to: 何月? "
  to_m = gets.to_i

  print "to: 何日? "
  to_d = gets.to_i

  print "理由: "
  reason = gets.to_s

  this_year = Date.today.year
  from_date = Date.parse("#{this_year}-#{from_m}-#{from_d}")
  to_date = Date.parse("#{this_year}-#{to_m}-#{to_d}")

  params = RequestParameter.new(from_date, to_date, reason).params
  Client.new(params).run
  exit
end

