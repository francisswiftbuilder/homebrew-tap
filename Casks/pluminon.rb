cask "pluminon" do
  version "2.0.1"
  sha256 "f612e1d2bfeee17ffce73c0f2f22e91308195a05a9ea2527b767537157c567c9"

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
