Deface::Override.new :virtual_path  => "issues/_action_menu_edit",
                     :name          => "rating_validation",
                     :insert_after  => "h3",
                     :text          => "<div id='rating_error'><%= render_error_messages ['Rating must be greater than zero'] %></div>"
