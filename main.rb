require "active_support/all"
Time.zone = "Warsaw"

lines = File.read("hours").lines

did_work_in_seconds = lines.reduce(0) do |sum, line|
  start, finish = line.split("-")
  finish = Time.zone.now.strftime("%H:%M") if finish.blank?
  sum += (Time.parse(finish) - Time.parse(start))
  sum
end

must_work_in_seconds = lines.count * 8 * 3600
time_remaining = Time.at(
  must_work_in_seconds - did_work_in_seconds
).utc.strftime("%H:%M")
puts "Time remaining: #{time_remaining}"
