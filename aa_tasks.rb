#!/usr/bin/env ruby
require 'Date'

DEADLINES = [ 'Submit progress report',
              'Do quiz' ]

TASKS = [ 'Do readings & watch videos',
          'Do homework projects',
          'Review coming exercises',
          'Process paper notes',
          'Push work to GitHub / pull it down',
          'Review solutions' ]

PREFIX = 'SCHD'

def prepare_todo(task, priority, date)
  "* #{PREFIX} #{task}\n  #{priority}: <#{date} #{date.strftime('%a')}>\n"
end

def prepare_todos
  date = make_weekday(Date.today)
  output = ""
  TASKS.each { |task| output << prepare_todo(task, "SCHEDULED", date) }
  DEADLINES.each { |task| output << prepare_todo(task, "DEADLINE", date) }
  output
end

def make_weekday(date)
  return date if date.wday.between?(1, 4)
  make_weekday(date + 1)
end

def main
  text = prepare_todos
  puts text
  system("echo \"#{text}\" | pbcopy")
end

main
