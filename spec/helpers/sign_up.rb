
def sign_up
  visit '/users/new'
  fill_in :email,    with: 'test@live.com'
  fill_in :password, with: 'test'
  fill_in :password_confirmation, with: 'test'
  click_button('Sign up')
end

def sign_up_wrong
  visit '/users/new'
  fill_in :email,    with: 'test@live'
  fill_in :password, with: 'test'
  fill_in :password_confirmation, with: 'tes'
  click_button('Sign up')
end

def no_email
  visit '/users/new'
  fill_in :email,    with: nil
  fill_in :password, with: 'test'
  fill_in :password_confirmation, with: 'test'
  click_button('Sign up')
end
