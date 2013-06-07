class Results
  attr_accessor :raw_string
  attr_accessor :scenario_stats
  attr_accessor :steps_stats
  attr_accessor :failed_string

  def initialize(str)
    @raw_string = str
  end
end