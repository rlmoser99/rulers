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
