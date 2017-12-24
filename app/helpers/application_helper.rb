module ApplicationHelper
	def gravatar_for(user, opts = {})
		opts[:alt] = user.name
		image_tag "https://www.gravatar.com/avatar/#
		{Digest::MD5.hexdigest(user.email)}?s=#{opts.delete(:size) { 40 }}",
		opts
	end

	def activity_resources_exist?(activity)
    activity && activity.trackable && activity.owner
  end

	def changetime(resource)
	hello = DateTime.parse(resource)
  hello.strftime("%d %b. %Y")
  hello.strftime("%H:%M")
  end
end
