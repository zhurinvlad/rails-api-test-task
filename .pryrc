Pry.config.color  = true
Pry.config.prompt = Pry::NAV_PROMPT

begin
  require 'awesome_print'
  AwesomePrint.pry!
rescue LoadError
  puts 'no awesome_print :('
end
