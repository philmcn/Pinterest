xml.instruct! :xml, :version => "1.0" 
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Funny Fake Ads"
    xml.description "A blog about software and chocolate"
    xml.link pins_url

    for post in @pins
      xml.item do
        xml.title post.description
        xml.description {
          if !post.image.blank?
            xml.cdata!(link_to image_tag(post.image(:medium),width: 130), post)
          end
          if !post.youtube_url.blank?
            xml.cdata!(link_to youtube_embed_image_rss(post.youtube_url).html_safe, post)
          end
          xml.cdata!("</br>")
          xml.cdata!(post.brand)
        }
        xml.pubDate post.created_at.to_s(:rfc822)
        xml.link pin_url(post)
        xml.guid pin_url(post)
      end
    end
  end
end