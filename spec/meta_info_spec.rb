require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe MetaInfo do  

  let(:opengraph){ File.open(File.dirname(__FILE__) + '/examples/opengraph.html').read }
  let(:twitter_card){ File.open(File.dirname(__FILE__) + '/examples/twitter_card.html').read }
  let(:meta_tags){ File.open(File.dirname(__FILE__) + '/examples/meta_tags.html').read }

  describe ".parse" do
    it "should return false for nil or empty html" do
      MetaInfo.parse("").should be_false
      MetaInfo.parse(nil).should be_false
    end

    it "should return MetaInfo::Document for valid html" do
      MetaInfo.parse(meta_tags).should be_kind_of(MetaInfo::Document)
      MetaInfo.parse(opengraph).should be_kind_of(MetaInfo::Document)
      MetaInfo.parse(twitter_card).should be_kind_of(MetaInfo::Document)
    end
  end

  describe MetaInfo::Document do
    it "should return proper title" do
      MetaInfo.parse(meta_tags).title.should eq("testing title")
      MetaInfo.parse(opengraph).title.should eq("testing title")
      MetaInfo.parse(twitter_card).title.should eq("testing title")
    end

    it "should return proper description" do
      MetaInfo.parse(meta_tags).description.should eq("testing description")
      MetaInfo.parse(opengraph).description.should eq("testing description")
      MetaInfo.parse(twitter_card).description.should eq("testing description")
    end

    it "should return proper image" do
      MetaInfo.parse(meta_tags).image.should be_false
      MetaInfo.parse(opengraph).image.should eq("image_url")
      MetaInfo.parse(twitter_card).image.should eq("image_url")
    end
  end
end