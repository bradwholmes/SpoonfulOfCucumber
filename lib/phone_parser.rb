class Phone_Parser
  def parse (str)
    features = str.split(/Feature:/)

    for line in lines

    end

  end

  def isFeature(str)
    return str =~ /Features/
  end

  def isScenarios(str)
    return str =~ /Scenarios/
  end
end