atom_feed :language => 'en-US' do |feed|
  feed.title"funny fake ads"
  
  @pins.each do |item|
    next if item.created_at.blank?

    feed.entry( item ) do |entry|
      entry.url pin_url(item)
      entry.title item.description
      entry.media :thumbnail, url: item.image(:thumb), height: 50, width:50
      entry.content item.brand, :type => 'html'

        end
  end
end