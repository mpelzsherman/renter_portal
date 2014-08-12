module User
  def full_name
    name_parts = [account.first_name, account.last_name]
    first_last = name_parts.join(' ')
    first_last == ' ' ? email : first_last
  end
end