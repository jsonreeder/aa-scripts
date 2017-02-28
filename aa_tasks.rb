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

def prepare_todo(task, prefix, priority, date = Date.today)
  "* #{prefix} #{task}\n  #{priority}: <#{date} #{date.strftime('%a')}>\n"
end

def prepare_todos
  output = ""
  TASKS.each { |task| output << prepare_todo(task, PREFIX, "SCHEDULED") }
  DEADLINES.each { |task| output << prepare_todo(task, PREFIX, "DEADLINE") }
  output
end

def main
  text = prepare_todos
  puts text
  system("echo \"#{text}\" | pbcopy")
end

main
