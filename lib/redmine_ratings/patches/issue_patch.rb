require_dependency 'issue'

module RedmineRatings
  module Patches
    module IssuePatch
      def self.included(base)
        base.class_eval do
          include InstanceMethods

          after_save :save_rating

          attr_accessor :rating_list

          has_many :ratings, dependent: :destroy

          def current_rating
            rating.nil? ? nil : rating
          end

          def save_rating
            rating_list.each do |rating_type, rating_value|
              rating = Rating.find_by(type_id: rating_type, issue_id: id)

              if rating.nil?
                Rating.create(
                  issue_id: id,
                  value: rating_value,
                  type_id: rating_type,
                  author_id: User.current.id
                )
              else
                rating.update(
                  issue_id: id,
                  value: rating_value,
                  type_id: rating_type,
                  author_id: User.current.id
                )
              end
            end
          end

          alias_method :safe_attributes_without_safe_rating=, :safe_attributes=
          alias_method :safe_attributes=, :safe_attributes_with_safe_rating=
        end
      end

      module InstanceMethods
        def safe_attributes_with_safe_rating=(attrs, user = User.current)
          self.safe_attributes_without_safe_rating = attrs

          self.rating_list ||= {}

          RatingType.all.each do |rt|
            if attrs && attrs["rating_#{rt.value}"]
              rating = attrs["rating_#{rt.value}"]
              self.rating_list["#{rt.id}"] = rating
            end
          end
        end
      end
    end
  end
end

unless Issue.included_modules.include?(RedmineRatings::Patches::IssuePatch)
  Issue.send(:include, RedmineRatings::Patches::IssuePatch)
end
