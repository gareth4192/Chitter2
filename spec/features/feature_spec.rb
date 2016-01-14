
feature 'Chitter' do
  feature '.Viewing peeps' do
    scenario ',user is able to see list of peeps on homepage' do
      Peep.create(peep: 'test')
      visit '/'
      expect(page.status_code).to eq 200
      within 'ul#peeps' do
        expect(page).to have_content('test')
      end
    end
  end

  feature '.Creating peeps' do
    scenario ',add a peep' do
      visit '/peeps/new'
      fill_in(:peep, with: 'testing123')
      click_button('Submit')
      within 'ul#peeps' do
        expect(page).to have_content('testing123')
      end
    end
  end

  feature '.Sign up' do
    scenario ',user can register' do
      expect { sign_up }.to change(User, :count).by(1)
      expect(page).to have_content('Welcome, test@live.com')
      expect(User.first.email).to eq('test@live.com')
    end
  end

end
