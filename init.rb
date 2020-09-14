require 'redmine'

Redmine::Plugin.register :redmine_raitings do
  name 'redmine_raitings plugin'
  author 'Yunes Zadi'
  description 'This is a plugin for users raiting'
  version '1.0.0'
  url 'https://contentadore.com'
  author_url 'https://github.com/yuneszadi'

  settings :default => {
  }, :partial => 'settings/ratings/ratings'

  menu :admin_menu, :ratings, {:controller => 'settings', :action => 'plugin', :id => "redmine_raitings"}, :caption => :raitings_title, :html => {:class => 'icon'}
end

require 'redmine_raitings'

Rails.application.paths['app/overrides'] ||= []
Dir.glob("#{Rails.root}/plugins/*/app/overrides").each do |dir|
  unless Rails.application.paths['app/overrides'].include?(dir)
    Rails.application.paths['app/overrides'] << dir
  end
end
