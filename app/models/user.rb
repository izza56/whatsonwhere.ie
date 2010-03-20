class User < ActiveRecord::Base
  has_one :business
<<<<<<< HEAD
  ajaxful_rateable :dimensions => [:quality], :allow_update => true
  ajaxful_rater
  
=======


>>>>>>> 9969a3d6964c79fbb67cbad780a18d568b1b51c0
  acts_as_authentic

  def deliver_password_reset_instructions!
    reset_perishable_token!
    Notifier.deliver_password_reset_instructions(self)
  end
end
