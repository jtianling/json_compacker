# JsonCompacker
compack multiple json files into one, for the loading speed

## Installation

Install it yourself as:

    $ sudo gem install json_compacker

On Mac you need set the install path to local for the special feature on Mac

    $ sudo gem install -n /usr/local/bin json_compacker

## Usage

```ruby
json_compacker -s src_json_path -o output_file
```

every json will compack into a single file with a key-value which key is the filename and value is origin json object.

## Example
in the src path,  test path have
a.json: 
{
  "a": 1
}

b.json: 
{
  "b": "b"
}

c.json:
{
  "c" : [1,2,3],
  "d" : "d"
}

output is:(compacked without space)
{"a":{"a":1},"b":{"b":"b"},"c":{"c":[1,2,3],"d":"d"}}


## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/jtianling/json_compacker. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

