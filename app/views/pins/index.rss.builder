xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Funny Fake Ads"
   
    xml.content "Image"   
    
     xml.link pins_url

    for post in @pins
      xml.item do
        xml.title post.brand       
        xml.content image_tag(post.image.url(:thumb))
        #xml.media :thumbnail, url: post.image(:thumb), height: 50, width:50        
        xml.pubDate post.created_at.to_s(:rfc822)
         xml.pin_id post.id

        xml.link pin_url(post)
      end
    end
  end
end