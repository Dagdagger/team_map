class TwilioController < ApplicationController
	skip_before_action :verify_authenticity_token 

	def voice
	response = Twilio::TwiML::Response.new do |r|
	r.Sms "Good you're going to this event "
	end
	
render :xml => response.to_xml
end

end
