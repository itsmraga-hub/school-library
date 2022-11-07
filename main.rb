require './operations'
require './app'

@operations = Operations.new

def main
  @operations.start_program
end

main
