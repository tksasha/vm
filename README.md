# Requirements
- `ruby 2.7.0p0`

# Instalation
- `git clone git@github.com:tksasha/vm.git`
- `bundle install`

# Development
- implement feature
- run specs
```
rake
```
- run `cops`
```
  brakeman --quiet --ensure-latest --no-pager
  bundler audit update && bundler audit check
  bundler leak update && bundler leak check
  fasterer
  rubocop
```
- commit and push that feature

# Usage
- `bin/vm`

# TODO
- need more QA tests
