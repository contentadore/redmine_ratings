if Redmine::Plugin.installed?(:redmine_people)
  Deface::Override.new :virtual_path  => "people/_sidebar",
                       :name          => "rates_table",
                       :insert_after  => 'div#links',
                       :text          => "<div id='issue_tree'><%= link_to 'Rates', rates_path %></div>"

end
