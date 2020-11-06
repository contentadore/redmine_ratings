if Redmine::Plugin.installed?(:redmine_people)
  Deface::Override.new :virtual_path  => "people/_attributes",
                       :name          => "add_rate_form_to_people_settings",
                       :insert_after  => 'div#attributes',
                       :text          => "<div id='issue_tree'><%= render 'rate_ratings/rate_ratings_people'%></div>"

end
