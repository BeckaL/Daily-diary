require 'pg'

class Diary

  def self.create
    @diary || Diary.new
  end

  def view_titles
    con = connect_to_database
    data = con.exec('SELECT title FROM entries;')
    data.map { |entry| entry["title"]}.join(' ')
  end

  def view_text(title)
    con = connect_to_database
    entry = con.exec("SELECT text FROM entries WHERE title = '#{title}';")
    entry.map { |e| e["text"]}.first
  end

  def add(title, text)
    con = connect_to_database
    con.exec("INSERT INTO entries (title, text) VALUES ('#{title}', '#{text}');")
  end

  def connect_to_database
    return PG.connect dbname: "daily_diary_test" if ENV['RACK_ENV'] == 'test'
    PG.connect dbname: "daily_diary"
  end
end
