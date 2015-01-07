# Get information about any iOS app using this gem

How:
```ruby
require 'apple_appstore_search'

app = AppleAppstoreSearch.new()
ipa = app.search('<yourAppId>')
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

I made this gem because I needed this functionality for a different project. It doesn't include all the details but I might add more if I need to. 

Happy hacking.