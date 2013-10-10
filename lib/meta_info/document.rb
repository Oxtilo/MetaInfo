module MetaInfo
  
  class Document

    def initialize(html)
      raise MetaInfo::Exception::NoHTML if html.nil? || html.empty?
      @doc = Nokogiri::HTML.parse(html)
    end

    def doc
      @doc
    end

    def title
      get_attr("title") || meta_title
    end

    def description
      get_attr("description") || meta_description
    end

    def image
      get_attr("image")
    end

    def valid?
      title != false
    end

    def meta_description
      search_meta("name", /^description$/i, "content")
    end

    def twitter_attr(name)
      search_meta('name', /^twitter:#{name}$/i, 'content')
    end

    def og_attr(name)
      search_meta('property', /^og:#{name}$/i, 'content')
    end

    def meta_title
      if doc.css("title").empty?
        return false
      else
        return doc.css("title")[0].text
      end
    end

    def get_attr(name)
      og_attr(name) || twitter_attr(name)
    end

    def search_meta(attribute, regexp, value_key)
      doc.css('meta').each do |m|
        if m.attribute(attribute) && m.attribute(attribute).to_s.match(regexp)
          return m.attribute(value_key).to_s
        end
      end
      return false
    end

    
  end

end
