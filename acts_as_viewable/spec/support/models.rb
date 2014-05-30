require 'acts_as_viewable'

class User < ActiveRecord::Base
  acts_as_viewer
end

class Page < ActiveRecord::Base
  acts_as_viewable
end
