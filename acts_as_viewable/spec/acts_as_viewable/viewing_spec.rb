require 'spec_helper'

describe ActsAsViewable::Viewing do
  # Associations
  it { should belong_to(:viewable) }
  it { should belong_to(:viewer) }

  #Validations
  it { should validate_presence_of(:viewable) }
  it { should validate_presence_of(:viewer) }
end

