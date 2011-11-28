class Account < ActiveRecord::Base
  belongs_to :owner, :class_name => :user
  has_many :users

  #after adding a new account, assign users to it
  after_commit :assign_users

  private
    def assign_users
      users = User.where("account_id is NULL")

      users.each do |u|
        if u.use_time
          self.users<< u
        end
      end
    end
end
