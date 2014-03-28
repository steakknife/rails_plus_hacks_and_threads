HighVoltage.configure do |config|
  config.route_drawer = HighVoltage::RouteDrawers::Root # static pages on /
  config.content_path = '../pages/'
  config.action_caching = config.action_caching_layout = true if defined? ActionPack::ActionCaching
  config.page_caching = true if defined? ActionPack::PageCaching
end if defined? HighVoltage
