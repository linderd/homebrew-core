# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Openiked < Formula
  desc "Internet Key Exchange version 2 (IKEv2) daemon - portable version of OpenBSD iked "
  homepage "https://openiked.org"
  url "https://ftp.openbsd.org/pub/OpenBSD/OpenIKED/openiked-7.2.tar.gz"
  mirror "https://github.com/openiked/openiked-portable/archive/refs/tags/v7.2.tar.gz"
  sha256 "55dc270bc40a121f855d949a25a5ffaeb11e7607e8198ec52160ef54b6946845"
  license "ISC"

  depends_on "cmake" => :build
  depends_on "libevent"
  depends_on "openssl@1.1"

  def install
    # DHOMEBREW=true ensures correct homebrew-libs on macOS
    system "mkdir build && cd build && cmake -DHOMEBREW=true -DCMAKE_BUILD_TYPE=Release .. && make"
    # TODO install?
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test openiked-portable`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    # TODO use TEST DH
    system "./openiked-portable/build/iked/iked -V"
  end
end
