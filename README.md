![Ruby](https://img.shields.io/badge/ruby-2.7.0-green.svg)
![Version](https://img.shields.io/badge/version-0.2.0-orange.svg)

# Prompt API - BIN Checker - Ruby Package

`bin_checker_rb` is a simple python wrapper for [bincheck-api][bincheck-api].

## Requirements

1. You need to signup for [Prompt API][promptapi-signup]
1. You need to subscribe [bincheck-api][bincheck-api], test drive is **free!!!**
1. You need to set `PROMPTAPI_TOKEN` environment variable after subscription.

then;

```bash
$ gem install bin_checker_rb
```

---

## Example Usage

```ruby
require "bin_checker_rb"

bin_information = BinCheckerRb.check('302596')
bin_information[:bank_name] # "Diners Club International"

# {
#     :bank_name=>"Diners Club International", 
#     :country=>"United States Of America", 
#     :url=>"www.dinersclub.com", 
#     :type=>"Credit", 
#     :scheme=>"Discover", 
#     :bin=>"302596"
# }
```

---

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then,
run `rake test` to run the tests. You can also run `bin/console` for an
interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.
To release a new version, update the version number in `version.rb`, and then
run `bundle exec rake release`, which will create a git tag for the version,
push git commits and tags, and push the `.gem` file to
[rubygems.org][rubygems]

```bash
$ rake -T

rake build            # Build bin_checker_rb-X.X.X.gem into the pkg directory
rake clean            # Remove any temporary products
rake clobber          # Remove any generated files
rake install          # Build and install bin_checker_rb-X.X.X.gem into system gems
rake install:local    # Build and install bin_checker_rb-X.X.X.gem into system gems without network access
rake release[remote]  # Create tag v0.0.0 and build and push bin_checker_rb-X.X.X.gem to rubygems.org
rake test             # Run tests
```

---

## License

This project is licensed under MIT

---

## Contributer(s)

* [Prompt API](https://github.com/promptapi) - Creator, maintainer

---

## Contribute

Bug reports and pull requests are welcome on GitHub:

1. `fork` (https://github.com/promptapi/bin-checker-rb/fork)
1. Create your `branch` (`git checkout -b my-feature`)
1. `commit` yours (`git commit -am 'Add awesome features...'`)
1. `push` your `branch` (`git push origin my-feature`)
1. Than create a new **Pull Request**!

This project is intended to be a safe,
welcoming space for collaboration, and contributors are expected to adhere to
the [code of conduct][coc].

---


[bincheck-api]:     https://promptapi.com/marketplace/docs/bincheck-api
[promptapi-signup]: https://promptapi.com/#signup-form
[rubygems]:         https://rubygems.org
[coc]:              https://github.com/promptapi/bin_checker_rb/blob/main/CODE_OF_CONDUCT.md
