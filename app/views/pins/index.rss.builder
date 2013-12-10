xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.brand "Ads"
    xml.description "My Funny Fake Ads"
    xml.youtube_url "Youtube URL"
    xml.image_file_name "Image"
    xml.created_at "Created At"
    xml.updated_at "Updated At"
    xml.user_id "User Id"
    xml.pin_id "Pin Id"
    xml.link pins_url

    for post in @pins
      xml.item do
        xml.brand post.brand  
        xml.description post.description
        xml.youtube_url post.youtube_url
        xml.link post.image(:medium)
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