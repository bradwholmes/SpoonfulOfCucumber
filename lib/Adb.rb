require 'calabash-android/helpers'

class Adb
  def self.adb_command
    android_home = ENV['ANDROID_HOME']
    is_windows? ? "#{android_home}\\platform-tools\adb.exe" : "#{android_home}/platform-tools/adb"
  end

  def self.devices
    lines = `#{adb_command} devices`.split("\n")
    lines.shift
    lines.collect { |l| l.split("\t").first}
  end
end