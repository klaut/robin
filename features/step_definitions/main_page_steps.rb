When /^I insert Redis url for (.*)$/ do |url|
    #pending # express the regexp above with the code you wish you had
  @redis = RedisService.for_url(url)
end

Then /^I should be connected to Redis on (.*)$/ do |url|
    pending # express the regexp above with the code you wish you had
end
