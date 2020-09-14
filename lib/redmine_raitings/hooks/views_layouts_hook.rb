module RedmineRaitings
  module Hooks
    class ViewsLayoutsHook < Redmine::Hook::ViewListener
      render_on :view_layouts_base_html_head, :partial => 'common/additional_assets'
    end
  end
end
