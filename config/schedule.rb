# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever

set :output, "#{path}/log/cron.log"

every :day, :at => '07:30am' do
	rake "scrape:bell" 
end

every :day, :at => '07:30am' do
rake "scrape:rogers" 
end

every :day, :at => '07:30am' do
rake "scrape:telus" 
end

every :day, :at => '07:30am' do
rake "scrape:wave" 
end

every :day, :at => '07:30am' do
rake "scrape:virgin" 
end

every :day, :at => '07:30am' do
rake "scrape:fido" 
end