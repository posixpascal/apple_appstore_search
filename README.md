# apple_appstore_search
Search your App's ID on Apple's App Store and retrieve all public data through a ruby Hash.

## Usage:

Be aware, this is a minefield. I use this in a very specific legacy application and haven't touched the code in at least 3 years.

I suggest you to take a peak at [SpaceShip](https://github.com/fastlane/fastlane/tree/master/spaceship), which is definitely superior to this little pile of code. 

Anyways, you've been warned:

```ruby
require 'apple_appstore_search'

app = AppleAppstoreSearch::Search.new()
ipa = app.search('yourAppId')
```

You'll get an instance of class AppleAppstoreSearch::App with the following keys:

```ruby
#[...]
ipa.name => Your App Name
ipa.version => Current Version
ipa.rating => Your App's rating
ipa.rates => Number of ratings
ipa.logo_url => high quality image
ipa.latest_updates => your last changelog for the app
ipa.last_updated => when did you update your app the last time
ipa.size => Your apps size
```

## License
```
Copyright 2018 Pascal Raszyk

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.```
