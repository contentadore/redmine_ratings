Deface::Override.new :virtual_path  => "issues/new",
                     :name          => "rating_validation",
                     :insert_after  => "div#watchers_form_container",
                     :text          => "
                      <div id='rating_error'><%= render_error_messages ['Rating must be greater than zero'] %></div>
                      <div id='language_error'><%= render_error_messages ['Language can not be empty'] %></div>
                      "
