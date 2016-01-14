require './app/models/user'
describe User do

  let!(:user) do
    User.create(email: 'gareth-123@hotmail.com', username: 't', password: '123',
               password_confirmation: '123')
  end

  it 'authenticates when given a valid email address and password' do
    authenticated_user = User.authenticate(user.email, user.password)
    expect(authenticated_user).to eq user
  end

  it 'Does not uthenticate when not given a valid email address and password' do
    expect(User.authenticate(user.email, 'nout')).to be_nil
  end
end
