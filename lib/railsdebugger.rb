module MyRailsDebugger
  def printsy *params
    compiled = ''
    params.each do |p|
      compiled += p.to_s
    end
    logger.dubug compiled
  end

  def putsy *params
    params.each do |p|
      logger.debug p.to_s
    end
  #rescue
  end

  @@alert_style="\033[7m"
  @@multiline = true
  def alert *params
    compiled = ''
    params.each do |p|
      compiled += p.to_s
      compiled += "\n" if @@multiline
    end
    if block_given?
      logger.debug @@alert_style + compiled
      done=yield
      #logger.debug @@alert_style
      logger.debug done
    else
      logger.debug @@alert_style + compiled
    end
    logger.debug "\033[0m"
  end
end