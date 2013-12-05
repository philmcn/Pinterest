module ApplicationHelper
	def youtube_embed(youtube_url)
	  if youtube_url[/youtu\.be\/([^\?]*)/]
	    youtube_id = $1
	  else
	    # Regex from # http://stackoverflow.com/questions/3452546/javascript-regex-how-to-get-youtube-video-id-from-url/4811367#4811367
	    youtube_url[/^.*((v\/)|(embed\/)|(watch\?))\??v?=?([^\&\?]*).*/]
	    youtube_id = $5
	  end

	  %Q{<iframe title="YouTube video player" width="1000" height="450" src="http://www.youtube.com/embed/#{ youtube_id }?rel=0&autoplay=1" frameborder="0" target='_parent' allowfullscreen ></iframe>}
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
 # def facebook_like
 # 	debugger
 # 	@oauth = Koala::Facebook::OAuth.new('674362825929827', '7cc5989b00027b86324d1268b6a4beec', {:client_options => {:ssl => {:ca_path => "/etc/ssl/  certs"}}, :scope=>"publish_stream,offline_access,read_stream,email"})
 #         #@api = Koala::Facebook::API.new("CAACEdEose0cBAMbucvWtZAy3K9aQZBkz1oZAqXkhN58FtKxH2l5y74yYSnYGuKZCUlRZBcTcHZARmIcdACLJfziMS74kN0KooiPxX0KlnUwDA0nTVRuJvFhd2xSEVzbWPS8f63gOGUZAAWZAwdVrWfYgvpuzDg4pcmRZB7IidDNmZAsp1nLolzZB7fXXLZBPbyDeZAeNecZBcs5fDXcQZDZD")
 #         @graph =Koala::Facebook::RestAPI.new("CAAJlVFSwdGMBAND8JVif3HOWE7CqEL9sf14ZCGnZAWHqal7gAEEGrfCiOYiZAzyYaX9LEGriWCOBtE2JJaLrgXU7PRVZBUj43b4eFGAv5PcIJqfZCTbx60nMWfMWSCDrffdyQpw09pkQFoSZBTTZBhsShR4bDrSaCPqSYgauZAsZAyBguuwXZCgFbSGi4N8ADUelfdaHCLqtOteAZDZD")
 #         uid = "http://hidden-chamber-6590.herokuapp.com/pins/<%= pin.id %>"
 #         @like_count = @graph.fql_query('select like_count FROM link_stat WHERE url = "' + uid + '"')
 #         #@rest.fql_query("select  like_count from link_stat where  url="http://hidden-chamber-6590.herokuapp.com/pins/14")


 #          end
        

end
