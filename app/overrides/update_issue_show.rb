Deface::Override.new :virtual_path  => "users/_form",
                     :name          => "add_rate_form_to_user_form",
                     :insert_after  => "div.splitcontent",
                     :text          => "<div id='issue_tree'><%= render 'rate_ratings/user_rate'%></div>"
