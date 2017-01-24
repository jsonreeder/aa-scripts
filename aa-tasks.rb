require 'Date'

TASKS = [ 'Review solutions',
          'Do readings',
          'Watch videos',
          'Do homework',
          'Review coming exercises',
          'Submit progress report',
          'Do quiz',
          'Go back to unfinished work' ]

PREFIX = 'SCHD'

def prepare_todo(task, prefix, date = Date.today)
  "* #{prefix} #{task}\n  SCHEDULED: <#{date} #{date.strftime('%a')}>\n"
end

def prepare_todos
  output = ""
  TASKS.each do |task|
    output << prepare_todo(task, PREFIX)
  end
  output
end

def main
  text = prepare_todos
  puts text
  system("echo \"#{text}\" | pbcopy")
end

main
