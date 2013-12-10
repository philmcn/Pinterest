class Pin < ActiveRecord::Base
  include ApplicationHelper

  # Slugs via FriendlyId
  extend FriendlyId
  friendly_id :a_brand, :use => :slugged

  def a_brand
    "#{brand} #{description}"
  end

   letsrate_rateable "rating"
 opinio_subjectum
  attr_accessible :description, :image, :image_remote_url, :youtube_url,:brand,:name,:summary,:url,:published_at,:guid

  	validates :description, presence: true
  	validates :user_id, presence: true
    validates_attachment_content_type :image,
       :content_type => ['image/jpeg', 'image/png', 'image/gif','image/jpg'],
       :message      => ",Please enter valid image type path"
  	  	# validates_attachment :image, presence: true, 
  	# 							content_type: { content_type: ['image/jpeg', 'image/jpg', 'image/png', 'image/gif'] },
   #                          	size: { less_than: 5.megabytes } 
     	belongs_to :user
  	has_attached_file :image, styles: { medium: "320x240"}



  	def image_remote_url=(url_value)
  			self.image = URI.parse(url_value) unless url_value.blank?
  		super	
  	end

    def self.top_rated
      ids = RatingCache.where(cacheable_type:"Pin").order("avg DESC").map(&:cacheable_id)
      records = find(ids)
      sorted_records = ids.collect {|id| records.detect {|x| x.id == id}}
    end

  #    def self.update_from_feed(feed_url) 
  #   feed = Feedzirra::Feed.fetch_and_parse(feed_url)
  #   feed.entries.each do |entry|
       
  #       create!(
  #         :name         => entry.title,
  #         :summary      => entry.summary,
  #         :url          => entry.url,
  #         :published_at => entry.published,
  #         :guid         => entry.id
  #       )
     
  #   end
  # end

end


