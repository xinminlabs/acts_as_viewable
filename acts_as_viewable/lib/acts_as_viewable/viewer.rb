module ActsAsViewable
  module Viewer
    extend ActiveSupport::Concern

    def view!(viewable)
      self.viewings.create viewable: viewable
    end

    def viewed?(viewable)
      self.viewings.by_viewable(viewable).count > 0
    end

    module ClassMethods
      def acts_as_viewer(*args)
        has_many :viewings, class_name: 'ActsAsViewable::Viewing', as: :viewer
      end
    end
  end
end

ActiveRecord::Base.send :include, ActsAsViewable::Viewer
