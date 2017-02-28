#!/usr/bin/env ruby
require 'Date'

TASKS = [ 'Do readings & watch videos',
          'Do homework projects',
          'Submit progress report',
          'Review coming exercises',
          'Process paper notes',
          'Push work to GitHub / pull it down',
          'Review solutions',
          'Do quiz' ]

PREFIX = 'SCHD'

def prepare_todo(task, prefix, date = Date.today)
  "* #{prefix} #{task}\n  SCHEDULED: <#{date} #{date.strftime('%a')}>\n"
end

def prepare_todos
  output = ""
  TASKS.each { |task| output << prepare_todo(task, PREFIX) }
  output
end

def main
  text = prepare_todos
  puts text
  system("echo \"#{text}\" | pbcopy")
end

main
