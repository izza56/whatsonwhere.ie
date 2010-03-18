class User < ActiveRecord::Base
  has_one :business
  ajaxful_rateable :dimensions => [:quality], :allow_update => true
  ajaxful_rater
  
  acts_as_authentic

  def deliver_password_reset_instructions!
    reset_perishable_token!
    Notifier.deliver_password_reset_instructions(self)
  end
end
