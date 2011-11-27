class User < ActiveRecord::Base
  has_one :account
  belongs_to :watches, :class_name => :account
end
