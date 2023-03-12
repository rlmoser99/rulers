# Rulers

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/rulers`. To experiment with that code, run `bin/console` for an interactive prompt.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rulers'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install rulers

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Rebuilding Rails Troubleshooting

### Reources

* [Walkthrough of this tutorial](https://www.intermediateruby.com/rebuilding-rails-course-walkthrough)
* [Walkthrough author Rulers Repo](https://github.com/josh-works/rulers)
* [Noah Gibb's Rulers Repo](https://github.com/noahgibbs/rulers)
* [Noah Gibb's Best Quotes Repo](https://github.com/noahgibbs/best_quotes)
* [Rack spec](https://github.com/rack/rack/blob/main/SPEC.rdoc)
* [Rail's use of Rack](http://guides.rubyonrails.org/rails_on_rack.html)

### Debugging

Must require pry when needing to debug
```
require 'pry'
binding.pry
```

### Chapter 1 Error: gem build rulers

```
WARNING:  See https://guides.rubygems.org/specification-reference/ for help
ERROR:  While executing gem ... (Gem::InvalidSpecificationException)
    rulers-0.0.1 contains itself (rulers-0.0.1.gem), check your files list
```
Solution: Add the gem file to the `.gitignore` file, as explained in Exercise Five.

### Chapter 1 Error: ruby test/application_test.rb

```
...stack trace...
cannot load such file -- rails/test_unit/reporter (LoadError)
...stack trace...
Unable to activate actionpack-7.0.4.2, because rack-3.0.4.1 conflicts with rack (~> 2.0, >= 2.2.0) (Gem::ConflictError)
```

Solution: You may need to uninstall a conflicting version of rack: `gem uninstall rack`. However, running this command prepended with `bundle exec` should fix this issue.

### Chapter 3 Deprecation Warning & Error: bundler: failed to load command: rackup

```
➜  best_quotes git:(chapter3) bundle exec rackup -p 3001
Calling `DidYouMean::SPELL_CHECKERS.merge!(error_name => spell_checker)' has been deprecated. Please call `DidYouMean.correct_error(error_name, spell_checker)' instead.
bundler: failed to load command: rackup (/Users/rachelmoser/.rbenv/versions/3.1.2/bin/rackup)
Gem::Exception: can't find executable rackup for gem rack
  /Users/rachelmoser/.rbenv/versions/3.1.2/lib/ruby/gems/3.1.0/gems/bundler-2.1.4/lib/bundler/rubygems_integration.rb:374:in `block in replace_bin_path'
  /Users/rachelmoser/.rbenv/versions/3.1.2/lib/ruby/gems/3.1.0/gems/bundler-2.1.4/lib/bundler/rubygems_integration.rb:402:in `block in replace_bin_path'
  /Users/rachelmoser/.rbenv/versions/3.1.2/bin/rackup:25:in `<top (required)>'
```
If you can’t find the rackup command, make sure you updated your PATH environment variable to include the gems directory, back when you were installing Ruby and various gems! A ruby manager like rvm or rbenv can do this for you. 

https://github.com/rubygems/rubygems/issues/5234

bundle update --bundler

now the deprecation warning is gone, and the error is different

➜  rulers git:(chapter3) ✗ bundle exec rackup -p 3001
bundler: failed to load command: rackup (/Users/rachelmoser/.rbenv/versions/3.1.2/bin/rackup)
/Users/rachelmoser/.rbenv/versions/3.1.2/lib/ruby/gems/3.1.0/gems/bundler-2.4.8/lib/bundler/rubygems_integration.rb:308:in `block in replace_bin_path': can't find executable rackup for gem rack (Gem::Exception)
	from /Users/rachelmoser/.rbenv/versions/3.1.2/lib/ruby/gems/3.1.0/gems/bundler-2.4.8/lib/bundler/rubygems_integration.rb:336:in `block in replace_bin_path'
	from /Users/rachelmoser/.rbenv/versions/3.1.2/bin/rackup:25:in `<top (required)>'

https://guides.rubygems.org/rubygems-basics/

irb(main):001:0> $LOAD_PATH
=>
["/opt/homebrew/Cellar/rbenv/1.2.0/rbenv.d/exec/gem-rehash",
 "/Users/rachelmoser/.rbenv/versions/3.1.2/lib/ruby/site_ruby/3.1.0",
 "/Users/rachelmoser/.rbenv/versions/3.1.2/lib/ruby/site_ruby/3.1.0/arm64-darwin22",
 "/Users/rachelmoser/.rbenv/versions/3.1.2/lib/ruby/site_ruby",
 "/Users/rachelmoser/.rbenv/versions/3.1.2/lib/ruby/vendor_ruby/3.1.0",
 "/Users/rachelmoser/.rbenv/versions/3.1.2/lib/ruby/vendor_ruby/3.1.0/arm64-darwin22",
 "/Users/rachelmoser/.rbenv/versions/3.1.2/lib/ruby/vendor_ruby",
 "/Users/rachelmoser/.rbenv/versions/3.1.2/lib/ruby/3.1.0",
 "/Users/rachelmoser/.rbenv/versions/3.1.2/lib/ruby/3.1.0/arm64-darwin22"]

 ➜  rulers git:(chapter3) ✗ which rake
/Users/rachelmoser/.rbenv/shims/rake

* CAN NOT OMIT BUNDLE EXEC, BECAUSE LIKE THE BOOK WARNED, IT CAN NOT FIND THE RULERS GEM
➜  best_quotes git:(chapter3) rackup -p 3001
<internal:/Users/rachelmoser/.rbenv/versions/3.1.2/lib/ruby/3.1.0/rubygems/core_ext/kernel_require.rb>:85:in `require': cannot load such file -- rulers (LoadError)
	from <internal:/Users/rachelmoser/.rbenv/versions/3.1.2/lib/ruby/3.1.0/rubygems/core_ext/kernel_require.rb>:85:in `require'

https://www.mslinn.com/blog/2023/01/31/rackup.html

gem install rackup

➜  best_quotes git:(chapter3) ✗ bundle exec rackup -p 3001
bundler: failed to load command: rackup (/Users/rachelmoser/.rbenv/versions/3.1.2/bin/rackup)
/Users/rachelmoser/.rbenv/versions/3.1.2/lib/ruby/gems/3.1.0/gems/bundler-2.4.8/lib/bundler/rubygems_integration.rb:308:in `block in replace_bin_path': can't find executable rackup for gem rackup. rackup is not currently included in the bundle, perhaps you meant to add it to your Gemfile? (Gem::Exception)

* added rackup to Gemfile in best_quotes & it worked!

But when running server, I get the follow message:
Rack::Lint::LintError at /
uppercase character in header name: Content-Type
Ruby	/Users/rachelmoser/.rbenv/versions/3.1.2/lib/ruby/gems/3.1.0/gems/rack-3.0.4.2/lib/rack/lint.rb: in block in check_headers, line 653
Web	GET localhost/



