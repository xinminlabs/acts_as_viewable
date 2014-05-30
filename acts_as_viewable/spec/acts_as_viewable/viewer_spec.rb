require 'spec_helper'

describe ActsAsViewable::Viewer do
  before do
    User.extend ActsAsViewable::Viewer
    Page.extend ActsAsViewable::Viewable
    @user = User.create name: 'User'
    @page = Page.create name: 'Page'
  end

  subject { @user }

  # Associations
  it { should have_many(:viewings) }
end
