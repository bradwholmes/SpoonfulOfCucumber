require 'test/unit'
require '../lib/Adb'

class AdbTest < Test::Unit::TestCase
  def test_adb_command
    adb = Adb.new
    assert_equal adb.adb_command, '/Library/Android/platform-tools/adb'
  end
end