module InlineTester
  $__stack_ = 2
  $__out_string_ = ""

  public
  def assert boolean, message=nil
    unless boolean
      # MESSAGE::: Assertion did not pass.
      $__out_string_ += (message || 
        "Expected a truthy value, but instead got #{boolean}")
      stack_trace_print
    else

    end
  end

  def refute boolean, message=nil
    if boolean
      # MESSAGE::: Refution did not pass.
      $__out_string_ += (message || 
        "Expected a falsy value, but instead got #{boolean}")
      stack_trace_print
    else

    end
  end

  def assert_something_raised message=nil, &block
    begin
      yield
      # Message::: Nothing raised.
      $__out_string_ += (message || 
        "Expected #{block} to raise an Exception, but it did not.")
      stack_trace_print
    rescue => e
      
    end
  end

  def assert_matches string, pattern, message=nil
    $__stack_+=1
    assert(string =~ pattern, message || 
      "Expected #{string} to match #{pattern}, but it did not.")
    $__stack_-=1
  end

  def skip message=nil, &block
    $stdout.print message || "Skipped assertion."
    if block_given?
      yield
    end
  end

  def todo message=nil
    $stdout.print message || "TODO!"
    stack_trace_print true
  end

  private
  def stack_trace_print dont_alert=false

    $__out_string_ += " from:\n"
    
    # Print stack trace from _stack_ with at most 5 more deep 
    caller_locations($__stack_, 5).map do |call|
      $__out_string_ += "====> #{call.to_s}\n"
    end

    if dont_alert
      $stdout.print $__out_string_
    else
      Bugsnag.notify(RuntimeError.new($__out_string_), severity: "warning")
    end
  end

end

#unless ENV["RAILS_ENV"] == "test"
  include InlineTester
#end