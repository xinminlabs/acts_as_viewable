require 'spec_helper'

describe ActsAsViewable::Viewable do
  before do
    User.extend ActsAsViewable::Viewer
    Page.extend ActsAsViewable::Viewable
    @user = User.create name: 'User'
    @page = Page.create name: 'Page'
  end

  subject { @page }

  # Associations
  it { should have_many(:viewings) }
end
