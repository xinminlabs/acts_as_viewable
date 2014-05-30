module ActsAsViewable
  class Viewing < ActiveRecord::Base
    belongs_to :viewable, polymorphic: true
    belongs_to :viewer, polymorphic: true

    validates :viewable, :viewer, presence: true

    scope :by_viewable, ->(viewable) {
      where(viewable_id: viewable, viewable_type: viewable.class.to_s).order("viewable_id ASC")
    }

    scope :by_viewer, ->(viewer) {
      where(viewer_id: viewer, viewer_type: viewer.class.to_s).order("viewer_id ASC")
    }
  end
end
