if Redmine::Plugin.installed?(:redmine_people)
  Deface::Override.new :virtual_path  => "people/show",
                       :name          => "add_rate_form_to_people_settings",
                       :insert_after  => 'div.details',
                       :text          => "<div id='issue_tree'><%= render 'rate_ratings/rate_ratings_people'%></div>"

end
