require("minitest/autorun")
require("minitest/rg")
require_relative("../song")

class TestSong < Minitest::Test

  def setup
    @mammamia = Song.new("Mamma mia","ABBA","3:35")
  end

  def test_song_title
   assert_equal("Mamma mia",@mammamia.title)
  end


end
