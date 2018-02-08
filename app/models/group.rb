class Group < ActiveRecord::Base
  include PublicActivity::Model
   tracked only: [:create, :join], owner: Proc.new{ |controller, model| controller.current_user}
    groupify :group
end
