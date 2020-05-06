class Smoldyn < Formula
  desc "a spatial stochastic simulator for chemical reaction networks"
  homepage "http://smoldyn.org"
  version "2.63.git"
  head "https://github.com/dilawar/Smoldyn.git", :branch => "devel"

  depends_on "cmake" => :build
  depends_on "boost" => :build
  depends_on "pybind11" => :build
  depends_on "freeglut" => :build
  depends_on "python@3" 

  def install
    args = std_cmake_args
    args << "-DPYTHON_EXECUTABLE=$(which python3)"
    mkdir "_build" do 
      system "cmake", "..", *args
      system "make", "install" # if this fails, try separate make/make install steps
    end
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test smoldyn`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
