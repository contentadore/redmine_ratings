module CurrenciesHelper
  def administration_settings_tabs
    tabs = [
             {:name => 'general', :partial => 'currencies/general', :label => :label_general},
           ]
  end
end
