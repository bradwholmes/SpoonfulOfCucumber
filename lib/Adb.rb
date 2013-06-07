require 'calabash-android/helpers'

class Adb
  def adb_command
    android_home = ENV['ANDROID_HOME']
    if is_windows?
      "#{android_home}\\platform-tools\adb.exe"
    else
      "#{android_home}/platform-tools/adb"
    end
  end
end