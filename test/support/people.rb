module People
  def people
    filename = File.join("test", "fixtures", "files", "people_data.json")
    response = IO.read(filename)
    JSON.parse(response)
  end
end
