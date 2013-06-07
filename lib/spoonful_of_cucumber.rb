require 'Adb'
require 'countdownlatch'

class Spoonful_Of_Cucumber
  def self.main
    apk = ARGV.shift
    port = 34777

    latch = CountDownLatch.new Adb.devices.count

    Adb.devices.each_with_index do |device, index|
      Thread.new(device) {
        command = "calabash-android run #{apk} -s #{device} -p #{port + index}"
        puts command
        puts `#{command}`
        latch.coundown!
      }
    end

    latch.wait
  end
end