module UsersHelper

  def age(birthdate)
    now = Time.now.utc.to_date
    now.year - birthdate.year - (birthdate.to_date.change(:year => now.year) > now ? 1 : 0)
  end

  def instaconvo_interlocutor(instaconvo)
    instaconvo.recipient == current_user ? instaconvo.sender : instaconvo.recipient
  end


  def is_current_user?(user)
    user == current_user
  end

end
