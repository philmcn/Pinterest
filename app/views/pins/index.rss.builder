xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Ads"
   
    xml.content "Image"
    xml.created_at "Created At"
    xml.updated_at "Updated At"
    xml.user_id "User Id"
    xml.pin_id "Pin Id"
    xml.link pins_url

    for post in @pins
      xml.item do
        xml.title post.brand  
      
        xml.youtube_url post.youtube_url
        xml.content image_tag(post.image.url(:thumb))
        #xml.media :thumbnail, url: post.image(:thumb), height: 50, width:50
        xml.created_at post.created_at
        xml.updated_at post.updated_at
        xml.user_id post.user_id
        xml.pubDate post.created_at.to_s(:rfc822)
         xml.pin_id post.id

        xml.link pin_url(post)
      end
    end
  end
end