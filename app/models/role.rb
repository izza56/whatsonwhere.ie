# Jack added for implementing acl9 roles plugin http://github.com/be9/acl9

class Role < ActiveRecord::Base
    acts_as_authorization_role
end