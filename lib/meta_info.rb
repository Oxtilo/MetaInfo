require "nokogiri"
require "meta_info/version"
require "meta_info/exception"
require "meta_info/document"

module MetaInfo

  def self.parse(html)
    begin
      document = MetaInfo::Document.new(html)  
      if document.valid?
        return document
      else
        return false
      end
    rescue MetaInfo::Exception::NoHTML => e
      return false
    end
  end

end
