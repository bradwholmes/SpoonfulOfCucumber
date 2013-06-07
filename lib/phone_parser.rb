require 'Results'

class Phone_Parser
  def self.parse(result)
    #result.raw_string = result.raw_string.gsub(/\n/, '')

    result = get_step_stats(result)
    result = get_scenario_stats(result)

    strings = result.raw_string.split(/Failing Scenarios:/)
    result.raw_string = strings[0]

    if strings.length == 2
      result.failed_string = strings[1]
    end

    features = parse_features(result.raw_string)

    features.each { |feature|
      if /Step unsuccessful/ =~ feature
        scenarios = parse_scenarios(feature)
        print scenarios[0].strip
        print "\n"

        scenarios.each { |scenario|

          if /Step unsuccessful/ =~ scenario
            print "Failed Scenario:"
            print "\n"
            print scenario
          end

        }
      end

    }

    print result.scenario_stats
    print "\n"
    print "\n"
    print result.steps_stats
    print "\n"
    print "\n"

  end

  def self.get_scenario_stats(results)
    stats = /\d+ scenarios \((\d+ failed,? ?)?(\d+ passed)?\)/.match(results.raw_string)

    results.scenario_stats = stats
    results.raw_string = results.raw_string.gsub(/\d+ scenarios \((\d+ failed,? ?)?(\d+ passed)?\)/, '')

    return results
  end

  def self.get_step_stats(results)
    results.steps_stats = /\d+ steps \((\d+ failed,? ?)?(\d+ skipped,? ?)?(\d+ passed)?\)/.match(results.raw_string)
    results.raw_string = results.raw_string.gsub(/\d+ steps \((\d+ failed,? ?)?(\d+ skipped,? ?)?(\d+ passed)?\)/, '')

    return results
  end

  def self.get_failed_scenarios(results)
    str = results.raw_string.match(/Failing Scenarios:\w+/)
    str.split(/Failing Scenarios:/)
  end

  def self.parse_features (str)

    features = str.split(/Feature:/)
    i = 0
    while i < features.length
      features[i] = "Feature:"+features[i]
      i = i + 1
    end
    return features
  end

  def self.parse_scenarios(str)
    return str.split(/Scenario:/)
  end
end