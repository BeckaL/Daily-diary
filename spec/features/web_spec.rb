feature do

  scenario 'has homepage' do
    visit '/'
    expect(page).to have_content 'Welcome to your daily diary'
  end

  scenario 'adds entry' do
    visit '/'
    click_on 'Add diary entry'
    fill_in 'title', with: 'Thursday 18 October'
    click_on 'submit'
    expect(page).to have_content('Entry added')
  end

  scenario 'views entries' do
    visit '/'
    click_on 'Add diary entry'
    fill_in 'title', with: 'Thursday 18 October'
    fill_in 'text', with: 'makers all day'
    click_on 'submit'
    click_on 'view all'
    expect(page).to have_content 'Thursday 18 October'
  end

  scenario 'views text' do
    visit '/'
    click_on 'Add diary entry'
    fill_in 'title', with: 'Thursday'
    fill_in 'text', with: 'makers all day'
    click_on 'submit'
    click_on 'view all'
    click_link 'Thursday'
    expect(page).to have_content 'makers all day'
  end

end
