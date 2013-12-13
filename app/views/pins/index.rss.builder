xml.instruct! :xml, :version => "1.0" 
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Funny Fake Ad"
    xml.description "A blog about software and chocolate"
    xml.link pins_url

    for post in @pins
      xml.item do
        xml.title post.description
        xml.description post.brand
        xml.image (image_tag post.image(:medium))
        xml.pubDate post.created_at.to_s(:rfc822)
        xml.link pin_url(post)
        xml.guid pin_url(post)
      end
    end
  end
end