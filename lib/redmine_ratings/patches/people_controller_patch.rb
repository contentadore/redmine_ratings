# require_dependency 'people_controller'
# require_dependency 'people'

module RedmineRatings
  module Patches
    module PeopleControllerPatch
      def self.included(base)
        base.class_eval do
          before_action :save_rates, only: [:update]

          def save_rates
            if params['update_rate']
              params['update_rate'].to_enum.to_h.each do |key, value|
                unless value.kind_of?(Array)
                  value = value.to_enum.to_h
                  rate = Rate.find(value['id'])

                  rate.tracker_id = value['tracker']
                  rate.language_id = value['language_id']
                  rate.value = value['value']
                  rate.currency_id = value['currency_id']
                  rate.unit_qty = value['unit_qty']
                  rate.unit_type_id = value['unit_type_id']

                  rate.save
                end
              end
            end

            if params['create_rate']
              new_users = params['create_rate']['user_id'].reject { |t| t.empty? }
              new_trackers = params['create_rate']['tracker'].reject { |t| t.empty? }
              new_languages = params['create_rate']['language_id'].reject { |l| l.empty? }
              new_values =  params['create_rate']['value'].reject { |v| v.empty? }
              new_currencies = params['create_rate']['currency_id'].reject { |c| c.empty? }
              new_unit_qty = params['create_rate']['unit_qty'].reject { |uq| uq.empty? }
              new_unit_types = params['create_rate']['unit_type_id'].reject { |ut| ut.empty? }

              new_trackers.each_with_index do |v, i|
                Rate.create(
                  user_id: new_users[i],
                  tracker_id: new_trackers[i],
                  language_id: new_languages[i],
                  value: new_values[i],
                  currency_id: new_currencies[i],
                  unit_qty: new_unit_qty[i],
                  unit_type_id: new_unit_types[i]
                )
              end
            end
          end
        end
      end
    end
  end
end

if Redmine::Plugin.installed?(:redmine_people)
  unless PeopleController.included_modules.include?(RedmineRatings::Patches::PeopleControllerPatch)
    PeopleController.send(:include, RedmineRatings::Patches::PeopleControllerPatch)
  end
end
