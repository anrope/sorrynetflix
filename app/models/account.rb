class Account < ActiveRecord::Base
  belongs_to :owner, :class_name => "User"
  has_many :watchers, :class_name => "User"

  #after adding a new account, assign users to it
  after_commit :assign_users_to_account

  private
    def assign_users_to_account
      users = User.where("account_id is NULL")

      users = filter_overlapping_users(users)

      users.each do |u|
        if u.watch_time.first.start 
          logger.debug "snflxdebug: assigning #{u.name} to #{self.login}"
          self.watchers<< u
        end
      end
    end

    def filter_overlapping_users(users)
      users.collect do |u|
        [u.watch_times.first.start, u.watch_times.first.end]
      end
    end
end
