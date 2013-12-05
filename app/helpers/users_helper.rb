module UsersHelper
	def gravatar_for(user, version)
		# Returns the Gravatar (http://gravatar.com/) for the given user.
		gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
		gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
		
		if (version == :minor)
		  image_tag(gravatar_url, alt: user.username,  height: '48', width: '48', class:'gravatar')
		elsif (version == :mini)
		  image_tag(gravatar_url, alt: user.username,  height: '30', width: '30', class:'gravatar')
		else
		  image_tag(gravatar_url, alt: user.username, class: 'gravatar')
		end	
	end
	
	def default_minor_avatar
		image_tag("/assets/images/avatar/minor_avatar.jpg",height: '48', width: '48', class:'gravatar') 
	end

	def default_mini_avatar
		image_tag("/assets/images/avatar/mini_avatar.jpg",height: '30', width: '30', class:'gravatar') 
	end

end
