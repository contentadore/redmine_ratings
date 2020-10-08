require_dependency 'issue'

module RedmineRatings
  module Patches
    module IssuePatch
      def self.included(base)
        base.class_eval do
          include InstanceMethods

          after_save :save_rating

          attr_accessor :rating_list
          attr_accessor :language_id

          has_many :ca_ratings, dependent: :destroy
          has_one :issue_language, dependent: :destroy

          def save_rating
            issue = Issue.find(id)

            rate_id = Rate.where(
              user_id: issue.assigned_to_id,
              tracker_id: issue.tracker_id,
              language_id: language_id
            ).ids.first

            if issue.issue_language
              issue_language.update(value: language_id)
            else
              create_issue_language(value: language_id)
            end

            if rating_list
              rating_list.each do |rating_type, rating_value|
                rating = CaRating.find_by(type_id: rating_type, issue_id: id)
                author_role_id = User.current.roles.first

                if rating.nil?
                  CaRating.create(
                    issue_id: id,
                    value: rating_value,
                    type_id: rating_type,
                    author_id: User.current.id,
                    rate_id: rate_id,
                    author_role_id: author_role_id
                  )
                else
                  rating.update(
                    issue_id: id,
                    value: rating_value,
                    type_id: rating_type,
                    author_id: User.current.id,
                    rate_id: rate_id,
                    author_role_id: author_role_id
                  )
                end
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

          if attrs && attrs['language_id']
            self.language_id = attrs["language_id"]
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
