module RedmineRatings
  module Hooks
    class ViewsIssuesHook < Redmine::Hook::ViewListener
      render_on :view_issues_show_details_bottom, partial: 'issues/ratings'
      render_on :view_issues_form_details_bottom, partial: 'issues/ratings_form'
    end
  end
end
