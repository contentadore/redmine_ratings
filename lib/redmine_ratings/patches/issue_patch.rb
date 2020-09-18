require_dependency 'issue'

module RedmineRatings
  module Patches
    module IssuePatch
      def self.included(base)
        base.class_eval do
          include InstanceMethods

          after_save :save_rating

          attr_accessor :rating_list

          has_one :rating, dependent: :destroy

          def current_rating
            rating.nil? ? nil : rating
          end

          def save_rating
            rating_value = rating_list

            param = {}
            param['value'] = rating_value



            if Issue.find(id).rating.nil?
              Rating.create(
                issue_id: id,
                value: rating_value,
                type_id: User.current.type,
                author_id: User.current.id
              )
            else

              Issue.find(id).rating.update(
                issue_id: id,
                value: rating_value,
                type_id: User.current.type,
                author_id: User.current.id
              )
            end
          end

          alias_method :safe_attributes_without_safe_rating=, :safe_attributes=
          alias_method :safe_attributes=, :safe_attributes_with_safe_rating=
        end
      end

      module InstanceMethods
        def safe_attributes_with_safe_rating=(attrs, user = User.current)
          self.safe_attributes_without_safe_rating = attrs

          if attrs && attrs[:rating_list]
            rating = attrs[:rating_list]
            self.rating_list = rating
          elsif rating
            self.rating_list = rating.current
          end
        end
      end
    end
  end
end

unless Issue.included_modules.include?(RedmineRatings::Patches::IssuePatch)
  Issue.send(:include, RedmineRatings::Patches::IssuePatch)
end
