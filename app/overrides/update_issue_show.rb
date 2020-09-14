Deface::Override.new :virtual_path  => "users/_form",
                     :name          => "add_check_doc_button_to_issue_show_page",
                     :insert_after  => "div.splitcontent",
                     :text          => "<div id='issue_tree'><%= render 'rate_ratings/user_rate'%></div>"
