module SignupFormHelper
  def create_account(user)
    user.account ||= Account.new
    user
  end
end