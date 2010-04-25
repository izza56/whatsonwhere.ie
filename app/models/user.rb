class User < ActiveRecord::Base
  has_one :business
  ajaxful_rateable :dimensions => [:quality], :allow_update => true
  ajaxful_rater
  
  acts_as_authentic
  
  # Jack added for implementing acl9 roles plugin http://github.com/be9/acl9
  acts_as_authorization_subject  :association_name => :roles

  def deliver_password_reset_instructions!
    reset_perishable_token!
    Notifier.deliver_password_reset_instructions(self)
  end
end
