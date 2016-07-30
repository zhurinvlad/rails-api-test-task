# http://blog.bigbinary.com/2015/12/28/application-record-in-rails-5.html
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
