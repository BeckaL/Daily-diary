require 'diary'

describe Diary do

  it 'no entries at first' do
    expect(subject.view_titles).to eq ''
  end

  it 'adds an entry' do
    subject.add('Friday 19 October', '')
    expect(subject.view_titles).to include 'Friday 19 October'
  end

  it 'adds an entry with text and views' do
    subject.add('Friday 19 October', 'saw my sister')
    expect(subject.view_text('Friday 19 October')).to eq 'saw my sister'
  end

end
