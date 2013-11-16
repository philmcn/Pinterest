module ApplicationHelper
	def youtube_embed(youtube_url)
	  if youtube_url[/youtu\.be\/([^\?]*)/]
	    youtube_id = $1
	  else
	    # Regex from # http://stackoverflow.com/questions/3452546/javascript-regex-how-to-get-youtube-video-id-from-url/4811367#4811367
	    youtube_url[/^.*((v\/)|(embed\/)|(watch\?))\??v?=?([^\&\?]*).*/]
	    youtube_id = $5
	  end

	  %Q{<iframe title="YouTube video player" width="200" height="200" src="http://www.youtube.com/embed/#{ youtube_id }" ,'top=50, left=50, width=280, height=257, toolbar=no, menubar=no, location=no, scrollbars=no, resizable=no') frameborder="0" allowfullscreen></iframe>}
	end

end
