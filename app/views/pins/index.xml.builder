xml.instruct!
xml.pins do
  @pins.each do |post|
    xml.post do
      xml.title post.description
      xml.body post.brand
      xml.image do
      xml.url post.image
      end
      xml.created_at post.created_at
      
    end
  end
end