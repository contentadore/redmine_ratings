require 'redmine'

Redmine::Plugin.register :redmine_ratings do
  name 'redmine_ratings plugin'
  author 'ContentAdore'
  description 'This is a plugin for users rating'
  version '1.0.0'
  url 'https://contentadore.com'
  author_url 'https://contentadore.com/'

  settings :default => {
    'rating_visible' => '1',
    'rating_role_ids' => [''],
    'lang_visible' => '1',
    'lang_tracker_ids' => [''],
    'lang_role_ids' => [''],
  }, :partial => 'settings/ratings/ratings'

  menu :admin_menu, :ratings, {:controller => 'settings', :action => 'plugin', :id => "redmine_ratings"}, :caption => :ratings_title, :html => {:class => 'icon'}
end

require 'redmine_ratings'

Rails.application.paths['app/overrides'] ||= []
Dir.glob("#{Rails.root}/plugins/*/app/overrides").each do |dir|
  unless Rails.application.paths['app/overrides'].include?(dir)
    Rails.application.paths['app/overrides'] << dir
  end
end
