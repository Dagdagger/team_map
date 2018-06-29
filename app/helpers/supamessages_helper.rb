module SupamessagesHelper
  def self_or_other(supamessage)
    supamessage.user == current_user ? "self" : "other"
  end


    def supamessage_interlocutor(supamessage)
      supamessage.user == supamessage.instaconvo.sender ? supamessage.instaconvo.sender : supamessage.instaconvo.recipient
    end
end
