Deface::Override.new :virtual_path  => "issues/_edit",
                     :name          => "rating_validation",
                     :insert_after  => "div#new-attachments",
                     :text          => "
                      <div id='rating_error'><%= render_error_messages ['Rating must be greater than zero'] %></div>
                      <div id='language_error'><%= render_error_messages ['Language can not be empty'] %></div>
                      "
