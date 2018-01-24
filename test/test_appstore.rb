require 'minitest/autorun'
require 'apple_appstore_search'


class AppstoreTest < Minitest::Test  
  describe "when getting app id informations" do
    it "should receive all metadata from the store" do
      app = AppleAppstoreSearch::Search.new()
      ipa = app.search("1131040971")
      ipa.name.must_equal "DaToni - App"
      ipa.version.must_equal "3.0.159"
      refute_empty ipa.size
      assert_match(/MB/, ipa.size)
    end
  end
end