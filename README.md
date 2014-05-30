# ActsAsViewable

It traces viewings of models.

## Installation

Add this line to your application's Gemfile:

    gem 'acts_as_viewable', :github => 'xinminlabs/acts_as_viewable'

And then execute:

    $ bundle

## Usage

```ruby
class Viewable < ActiveRecord::Base
  acts_as_viewable
end

class Viewer < ActiveRecord::Base
  acts_as_viewer
end

@viewer.view!(viewable)
@viewer.viewed?(viewable)
@viewable.view_by(@viewer)
```

## Contributing

1. Fork it ( http://github.com/xinminlabs/acts_as_viewable/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
