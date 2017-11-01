class Eyesthatblink < Formula
  desc "Eyes that blink"
  homepage "http://eyesthatblink.com"
  url "https://github.com/dilawar/eyesthatblink/archive/master.tar.gz"
  version "0.9.git"
  #sha256 ":no-check"
  head "https://github.com/dilawar/eyesthatblink.git"

  depends_on "cmake" => :build
  depends_on "gtkmm" => :build
  depends_on "libnotify" 
  depends_on "boost"

  def install

    args = std_cmake_args
    args << "-DCMAKE_SKIP_RPATH=ON"
    mkdir "_build" do
      system "cmake", "..", *args
      system "make"
      system "make", "install"
    end

  end

end
