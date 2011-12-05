class User < ActiveRecord::Base
  has_one :owns, :class_name => "Account"
  belongs_to :watches, :class_name => "Account"
  has_and_belongs_to_many :watch_times

  after_commit :assign_user_to_account

  private
    def assign_user_to_account
      account = Account.find(1)

      if account
        logger.debug "snflxdebug: assigning #{self.name} to #{account.login}"
    
        self.account= account
      end
    end
end
