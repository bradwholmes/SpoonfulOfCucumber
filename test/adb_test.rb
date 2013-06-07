require 'test/unit'
require '../lib/adb'

class TestAdb < Test::Unit::TestCase
  def test_adb_devices
    assert_equal Adb.devices.count, 2
  end
end