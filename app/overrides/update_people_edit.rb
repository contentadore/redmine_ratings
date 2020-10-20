if Redmine::Plugin.installed?(:redmine_people)
  Deface::Override.new :virtual_path  => "people/_form",
                       :name          => "add_rate_form_to_people_settings_1",
                       :insert_after  => 'div#person_data',
                       :text          => "<div id='issue_tree'><%= render 'rate_ratings/user_rate'%></div>"

end
