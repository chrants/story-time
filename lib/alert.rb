# Moved to railsdebugger.rb
=begin
@@alert_style="\033[7m"
def alert message=nil
	if block_given?
        logger.debug @@alert_style+message.to_s
        done=yield
        logger.debug @@alert_style
        logger.debug done
    else
        logger.debug @@alert_style+message.to_s
    end
    logger.debug "\033[0m"
end
=end