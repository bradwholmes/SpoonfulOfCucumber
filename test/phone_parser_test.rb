require 'test/unit'
require '../lib/phone_parser'
require '../lib/Results'

class PhoneParserTest < Test::Unit::TestCase
  @@raw_string = "Feature: Login feature

  Scenario: When initially starting the app I am a guest # features\\my_first.feature:3
    When I press \"home\"                                  # calabash-android-0.4.3/lib/calabash-android/steps/press_button_steps.rb:17
      Step unsuccessful: Could not find anything to press matching: 'home' found:
      Buttons:
      Sign In
      Join uShip
      Content descriptions:
      Classes:
      android.widget.LinearLayout
      android.view.ViewStub
      android.widget.FrameLayout
      android.widget.LinearLayout
      android.widget.Button
      android.widget.Button
      com.android.internal.policy.impl.PhoneWindow$DecorView
       (RuntimeError)
      org/jruby/ext/timeout/Timeout.java:127:in `timeout'
      features\\my_first.feature:4:in `When I press \"home\"'
    Then I see \"Guest\"                                   # calabash-android-0.4.3/lib/calabash-android/steps/assert_steps.rb:5

Feature: Startup feature

  Scenario: When starting the app for the first time # features\\startup_feature.feature:3
    Then I see \"Sign In\"                             # calabash-android-0.4.3/lib/calabash-android/steps/assert_steps.rb:5
    And I see \"Join uShip\"                           # calabash-android-0.4.3/lib/calabash-android/steps/assert_steps.rb:5

Failing Scenarios:
cucumber features\\my_first.feature:3 # Scenario: When initially starting the app I am a guest

2 scenarios (1 failed, 1 passed)
4 steps (1 failed, 1 skipped, 2 passed)
0m54.796s"

  def test_can_get_features
    blah = Phone_Parser.parse_features(@@raw_string)

    print blah
    print "\n"
  end

  def test_can_get_scenarios
    features = Phone_Parser.parse_features(@@raw_string)

    features.each { |feature|
      scenarios = Phone_Parser.parse_scenarios(feature)

      for scenario in scenarios
        print scenario
        print "\n"
      end
    }
  end

  def test_can_get_scenario_stats
    result = Results.new(@@raw_string)

    result = Phone_Parser.get_scenario_stats(result)

    print result.scenario_stats
  end

  def test_can_get_step_stats
    result = Results.new(@@raw_string)

    result = Phone_Parser.get_step_stats(result)

    print result.steps_stats
  end

  def test_can_parse
    result = Results.new(@@raw_string)
    Phone_Parser.parse(result)

  end
end