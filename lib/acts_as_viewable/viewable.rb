module ActsAsViewable
  module Viewable
    extend ActiveSupport::Concern

    module ClassMethods
      def acts_as_viewable(*args)
        has_many :viewings, class_name: 'ActsAsViewable::Viewing', as: :viewable
      end

      def viewed_by(viewer)
        viewer.viewings.where(viewable_type: self.name).map(&:viewable)
      end
    end
  end
end

ActiveRecord::Base.send :include, ActsAsViewable::Viewable
