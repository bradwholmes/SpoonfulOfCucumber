require 'Adb'
require 'countdownlatch'
require 'phone_parser'
require 'Results'

class Spoonful_Of_Cucumber
  def self.main
    apk = ARGV.shift
    port = 34777

    latch = CountDownLatch.new Adb.devices.count

    results = []

    Adb.devices.each_with_index do |device, index|
      Thread.new(device) {
        command = "calabash-android run #{apk} ADB_DEVICE_ARG=#{device} TEST_SERVER_PORT=#{port + index}"
        puts command
        output = `#{command}`
        results << output
        latch.coundown!
      }
    end

    latch.wait

    results.each { |result| puts Phone_Parser.parse Results.new result }

  end
end