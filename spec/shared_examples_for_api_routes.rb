RSpec.shared_examples "an api route" do |route|
  it "throws a 401 when there is no token" do
    request(:get, "#{route}.xml")

    expect(response).to have_status(200)
  end

  it "accepts xml as a datatype" do
    request(:get, "#{route}.xml")

    expect(response).to have_status(200)
  end

  it "accepts json as a datatype" do
    request(:get, "#{route}.json")

    expect(response).to have_status(200)
  end

  it "returns a 406 when the content type is not known" do
    request(:get, "#{route}.bla")

    expect(response).to have_status(406)
  end
end
