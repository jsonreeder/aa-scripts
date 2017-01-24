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
  "* #{prefix} #{task}\n  SCHEDULED: <#{date} #{date.strftime('%a')}>"
end

def main
  TASKS.each do |task|
    puts prepare_todo(task, PREFIX)
  end
end

main
