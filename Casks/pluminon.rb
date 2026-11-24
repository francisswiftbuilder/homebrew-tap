cask "pluminon" do
  version "2.0.3"
  sha256 "193b720f4732c8bc25f5101be1d737be257ded7d961a27babd9eb8a44cb6c883"

  url "https://github.com/francisswiftbuilder/pluminon/releases/download/v#{version}/Pluminon-#{version}.dmg"
  name "PLUMINON"
  desc "Native Git client for visual repository management"
  homepage "https://github.com/francisswiftbuilder/pluminon"

  depends_on macos: :tahoe

  app "Pluminon.app"

  caveats <<~EOS
    PLUMINON is currently ad-hoc signed and not notarized by Apple.
    macOS may block the app on first launch.

    To open PLUMINON, go to System Settings → Privacy & Security
    and click "Open Anyway".
  EOS
end
