module ApplicationHelper
	def youtube_embed(youtube_url)
	  if youtube_url[/youtu\.be\/([^\?]*)/]
	    youtube_id = $1
	  else
	    # Regex from # http://stackoverflow.com/questions/3452546/javascript-regex-how-to-get-youtube-video-id-from-url/4811367#4811367
	    youtube_url[/^.*((v\/)|(embed\/)|(watch\?))\??v?=?([^\&\?]*).*/]
	    youtube_id = $5
	  end

	  %Q{<iframe title="YouTube video player" width="450" height="350" src="http://www.youtube.com/embed/#{ youtube_id }?rel=0&autoplay=1" frameborder="0" target='_parent' allowfullscreen autoplay=true></iframe>}
	end

    def youtube_embed_image(youtube_url)
	  if youtube_url[/youtu\.be\/([^\?]*)/]
	    youtube_id = $1
	  else
	    # Regex from # http://stackoverflow.com/questions/3452546/javascript-regex-how-to-get-youtube-video-id-from-url/4811367#4811367
	    youtube_url[/^.*((v\/)|(embed\/)|(watch\?))\??v?=?([^\&\?]*).*/]
	    youtube_id = $5
	  end

	  %Q{<img src="http://img.youtube.com/vi/#{ youtube_id }/0.jpg"/>}
	end


def javascript(*args)
  content_for(:head) { javascript_include_tag(*args) }
end
 def facebook_like
            content_tag :iframe, nil, :src => "http://www.facebook.com/plugins/like.php?href=#{CGI::escape(request.url)}&layout=standard&show_faces=true&width=450&action=like&font=arial&colorscheme=light&height=80", :scrolling => 'no', :frameborder => '0', :allowtransparency => true, :id => :facebook_like
          end
        

end
