require_dependency 'issue'

module RedmineRatings
  module Patches
    module IssuePatch
      def self.included(base)
        base.class_eval do
          include InstanceMethods

          after_save :save_rating

          attr_accessor :rating_list
          attr_accessor :language_list

          attr_accessor :language

          has_many :ca_ratings, dependent: :destroy

          def current_rating
            rating_list.nil? ? nil : rating_list
          end

          def save_rating
            issue = Issue.find(id)

            rate_id = Rate.where(
              user_id: issue.assigned_to_id,
              tracker_id: issue.tracker_id,
              language_id: language_list
            ).ids.first

            rating_list.each do |rating_type, rating_value|
              rating = CaRating.find_by(type_id: rating_type, issue_id: id)

              if rating.nil?
                CaRating.create(
                  issue_id: id,
                  value: rating_value,
                  type_id: rating_type,
                  author_id: User.current.id,
                  rate_id: rate_id
                )
              else
                rating.update(
                  issue_id: id,
                  value: rating_value,
                  type_id: rating_type,
                  author_id: User.current.id,
                  rate_id: rate_id
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

          if attrs && attrs['language']
            language = attrs["language"]
            self.language_list = language
          end

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
