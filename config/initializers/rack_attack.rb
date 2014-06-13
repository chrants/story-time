# Always allow requests from localhost
# (blacklist & throttles are skipped)
$WHITELIST =
  [
    '127.0.0.1'
  ]
Rack::Attack.whitelist('allow from whitelist') do |req|
  # Requests are allowed if the return value is truthy
  $WHITELIST.include? req.ip.to_s
end


$BLACKLIST =
  [

  ]
Rack::Attack.blacklist('block from blacklist') do |req|
  $BLACKLIST.include? req.ip.to_s
end

# Throttle requests to 100 requests per 10 seconds per ip
Rack::Attack.throttle('req/ip', :limit => 100, :period => 1.second) do |req|
  # If the return value is truthy, the cache key for the return value
  # is incremented and compared with the limit. In this case:
  #   "rack::attack:#{Time.now.to_i/1.second}:req/ip:#{req.ip}"
  #
  # If falsy, the cache key is neither incremented nor checked.

  req.ip
end

=begin
# You can also set a limit using a proc instead of a number. For
# instance, after Rack::Auth::Basic has authenticated the user:
limit_based_on_proc = proc {|req| req.env["REMOTE_USER"] == "admin" ? 100 : 1}
Rack::Attack.throttle('req/ip', :limit => limit_based_on_proc, :period => 1.second) do |req|
  req.ip
end
=end

# Throttle login attempts for a given email parameter to 6 reqs/2 minutes
# Return the email as a discriminator on POST /login requests
Rack::Attack.throttle('logins/email', :limit => 8, :period => 2.minutes) do |req|
  req.params['email'] if ['/login', '/user/login', '/member/login', '/admin/login'].include? req.path and req.post?
end

Rack::Attack.blacklisted_response = lambda do |env|
  # Using 503 because it may make attacker think that they have successfully
  # DOSed the site. Rack::Attack returns 401 for blacklists by default
  [ 503, {}, ['Blocked']]
end

Rack::Attack.throttled_response = lambda do |env|
  # name and other data about the matched throttle
  body = [
    env['rack.attack.matched'],
    env['rack.attack.match_type'],
    env['rack.attack.match_data']
  ].inspect

  # Using 503 because it may make attacker think that they have successfully
  # DOSed the site. Rack::Attack returns 429 for throttling by default
  [ 503, {}, [body]]
end