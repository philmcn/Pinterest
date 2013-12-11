xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Funny Fake Ad"
    xml.description "My Funny Fake Ads"
    xml.link pins_url
    for pin in @pins
      xml.item do
        xml.title pin.brand  
        xml.description pin.description
        xml.logo image_tag pin.image(:medium)  
        xml.pubDate pin.created_at.to_s(:rfc822)
        xml.link pin_url(pin)
      end
    end
  end
end