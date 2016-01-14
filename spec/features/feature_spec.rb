
feature 'Chitter.' do
  feature 'Viewing peeps,' do
    scenario 'user is able to see list of peeps on homepage' do
      Peep.create(peep: 'test')
      visit '/'
      expect(page.status_code).to eq 200
      within 'ul#peeps' do
        expect(page).to have_content('test')
      end
    end
  end

  feature 'Creating peeps,' do
    scenario 'add a peep' do
      visit '/peeps/new'
      fill_in(:peep, with: 'testing123')
      click_button('Submit')
      within 'ul#peeps' do
        expect(page).to have_content('testing123')
      end
    end
  end

  feature 'Sign up,' do
    scenario 'user can register' do
      expect { sign_up }.to change(User, :count).by(1)
      expect(page).to have_content('Welcome, test@live.com')
      expect(User.first.email).to eq('test@live.com')
    end
  end

  feature 'User sign up,' do
    scenario 'requires a matching confirmation password' do
      expect { sign_up_wrong }.not_to change(User, :count)
    end

    scenario 'displays error when passwords dont match' do
      sign_up_wrong
      expect(page).to have_content('Password does not match the confirmation')
    end

    scenario "I can't sign up without an email address" do
      expect { no_email }.not_to change(User, :count)
    end

    scenario 'I cannot sign up with an existing email' do
      sign_up
      expect { sign_up }.to_not change(User, :count)
      expect(page).to have_content('Email is already taken')
    end

    scenario 'I cannot sign up with an invalid email address' do
      expect { sign_up_wrong }.not_to change(User, :count)
      expect(page).to have_content('Email has an invalid format')
  end

  feature 'User sign in,' do
    scenario 'I can sign in' do
      sign_in
      expect(page).to have_content "Welcome, testemail@example.com"
    end
  end

  feature 'User sign out' do
    scenario 'while being signed in' do
      sign_in
      click_button 'Sign out'
      expect(page).to have_content('goodbye!')
      expect(page).not_to have_content('Welcome, testemail@example.com')
    end
  end
  end

end
