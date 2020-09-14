module RateRatingsHelper
  def rate_settings_tabs
    tabs = [{:name => 'currencies', :partial => 'rate_ratings/currencies', :label => :label_currencies},
            {:name => 'languages', :partial => 'rate_ratings/languages', :label => :label_languages},
            ]
  end
end
