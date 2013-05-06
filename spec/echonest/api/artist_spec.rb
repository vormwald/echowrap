require 'helper'

describe Echonest::API::Artist do

  before do
    @client = Echonest::Client.new(:api_key => "AK")
  end

  describe '#artist_biographies' do
    before do
      stub_get("/api/v4/artist/biographies").
      with(:query => {:id => 'ARH6W4X1187B99274F'}).
      to_return(:body => fixture("artist_biographies.json"),
                 :headers => {:content_type => "application/json; charset=utf-8"})
    end

    it "requests the correct resource" do
      @client.artist_biographies(:id => 'ARH6W4X1187B99274F')
      expect(a_get("/api/v4/artist/biographies").
      with(:query => {:id => 'ARH6W4X1187B99274F'})).
      to have_been_made
    end

    it "returns biographies" do
      biographies = @client.artist_biographies(:id => 'ARH6W4X1187B99274F')
      expect(biographies).to be_an Array
      expect(biographies.first.site).to eq 'last.fm'
      expect(biographies.first.license.attribution).to eq 'Last.fm'
    end
  end

  describe '#artist_blogs' do
    before do
      stub_get("/api/v4/artist/blogs").
      with(:query => {:id => 'ARH6W4X1187B99274F'}).
      to_return(:body => fixture("artist_blogs.json"),
                 :headers => {:content_type => "application/json; charset=utf-8"})
    end

    it "requests the correct resource" do
      @client.artist_blogs(:id => 'ARH6W4X1187B99274F')
      expect(a_get("/api/v4/artist/blogs").
      with(:query => {:id => 'ARH6W4X1187B99274F'})).
      to have_been_made
    end

    it "returns blogs" do
      blogs = @client.artist_blogs(:id => 'ARH6W4X1187B99274F')
      expect(blogs).to be_an Array
      expect(blogs.first.id).to eq '30fc8108d77316c6789140bef92ecc09'
    end
  end

  describe '#artist_familiarity' do
    before do
      stub_get("/api/v4/artist/familiarity").
      with(:query => {:id => 'ARH6W4X1187B99274F'}).
      to_return(:body => fixture("artist_familiarity.json"),
                 :headers => {:content_type => "application/json; charset=utf-8"})
    end

    it "requests the correct resource" do
      @client.artist_familiarity(:id => 'ARH6W4X1187B99274F')
      expect(a_get("/api/v4/artist/familiarity").
      with(:query => {:id => 'ARH6W4X1187B99274F'})).
      to have_been_made
    end

    it "returns familiarity" do
      familiarity = @client.artist_familiarity(:id => 'ARH6W4X1187B99274F')
      expect(familiarity).to be_an Echonest::Familiarity
      expect(familiarity.id).to eq 'ARH6W4X1187B99274F'
    end
  end

  describe '#artist_hotttnesss' do
    before do
      stub_get("/api/v4/artist/hotttnesss").
      with(:query => {:id => 'ARH6W4X1187B99274F'}).
      to_return(:body => fixture("artist_hotttnesss.json"),
                 :headers => {:content_type => "application/json; charset=utf-8"})
    end

    it "requests the correct resource" do
      @client.artist_hotttnesss(:id => 'ARH6W4X1187B99274F')
      expect(a_get("/api/v4/artist/hotttnesss").
      with(:query => {:id => 'ARH6W4X1187B99274F'})).
      to have_been_made
    end

    it "returns hotttnesss" do
      hotttnesss = @client.artist_hotttnesss(:id => 'ARH6W4X1187B99274F')
      expect(hotttnesss).to be_an Echonest::Hotttnesss
      expect(hotttnesss.id).to eq 'ARH6W4X1187B99274F'
    end
  end

  describe '#artist_images' do
    before do
      stub_get("/api/v4/artist/images").
      with(:query => {:id => 'ARH6W4X1187B99274F'}).
      to_return(:body => fixture("artist_images.json"),
                 :headers => {:content_type => "application/json; charset=utf-8"})
    end

    it "requests the correct resource" do
      @client.artist_images(:id => 'ARH6W4X1187B99274F')
      expect(a_get("/api/v4/artist/images").
      with(:query => {:id => 'ARH6W4X1187B99274F'})).
      to have_been_made
    end

    it "returns images" do
      images = @client.artist_images(:id => 'ARH6W4X1187B99274F')
      expect(images).to be_an Array
      expect(images.first.url).to eq 'http://userserve-ak.last.fm/serve/_/102639.jpg'
      expect(images.first.license.attribution).to eq 'last.fm'
    end
  end

  describe '#artist_list_genres' do
    before do
      stub_get("/api/v4/artist/list_genres").
      to_return(:body => fixture("artist_list_genres.json"),
                :headers => {:content_type => "application/json; charset=utf-8"})
    end

    it "requests the correct resource" do
      @client.artist_list_genres
      expect(a_get("/api/v4/artist/list_genres")).to have_been_made
    end

    it "returns genres" do
      genres = @client.artist_list_genres
      expect(genres).to be_an Array
      expect(genres.first.name).to eq 'a cappella'
    end
  end

  describe '#artist_list_terms' do
    before do
      stub_get("/api/v4/artist/list_terms").
      to_return(:body => fixture("artist_list_terms.json"),
                :headers => {:content_type => "application/json; charset=utf-8"})
    end

    it "requests the correct resource" do
      @client.artist_list_terms
      expect(a_get("/api/v4/artist/list_terms")).to have_been_made
    end

    it "returns terms" do
      terms = @client.artist_list_terms
      expect(terms).to be_an Array
      expect(terms.first.name).to eq '00s'
    end
  end

  describe '#artist_news' do
    before do
      stub_get("/api/v4/artist/news").
      with(:query => {:id => 'ARH6W4X1187B99274F'}).
      to_return(:body => fixture("artist_news.json"),
                 :headers => {:content_type => "application/json; charset=utf-8"})
    end

    it "requests the correct resource" do
      @client.artist_news(:id => 'ARH6W4X1187B99274F')
      expect(a_get("/api/v4/artist/news").
      with(:query => {:id => 'ARH6W4X1187B99274F'})).
      to have_been_made
    end

    it "returns news" do
      news = @client.artist_news(:id => 'ARH6W4X1187B99274F')
      expect(news).to be_an Array
      expect(news.first.id).to eq '29c1699c8464426781f3e012d29fc1f6'
    end
  end

  describe "#artist_search" do

    before do
      stub_get("/api/v4/artist/search").
      with(:query => {
            :results => 1,
            :artist => 'radiohead'}).
        to_return(:body => fixture("artist_search.json"),
                  :headers => {:content_type => "application/json; charset=utf-8"})
    end


    it "requests the correct resource" do
      @client.artist_search(:results => 1,
                          :artist => 'radiohead')
      expect(a_get("/api/v4/artist/search")
      .with(:query => {:results => 1,
                       :artist => 'radiohead'}))
      .to have_been_made
    end

    it "returns artists" do
      artists = @client.artist_search(:results => 1,
                          :artist => 'radiohead')
      expect(artists).to be_an Array
      expect(artists.first.name).to eq "Radiohead"
    end


  end

end

