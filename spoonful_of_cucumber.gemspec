Gem::Specification.new do |s|
  s.name = 'spoonful_of_cucumber'
  s.version = '0.0.0'
  s.date = '2013-06-06'
  s.summary = 'Spoonful of Cucumber'
  s.description = 'Spoon like features for Calabash-Android'
  s.files = ['lib/spoonful_of_cucumber.rb', 'lib/Adb.rb', 'lib/phone_parser.rb', 'lib/Results.rb']
  s.authors = ['brad holmes', 'm4 de añda', 'james logan']
  s.executable = 'spoonful_of_cucumber'

  s.add_dependency('calabash-android')
  s.add_dependency('countdownlatch')
end