cask "pluminon" do
  version "2.0.0"
  sha256 "09e4b1fd81e84001e2eab68ca9c89a17372981d1627b682cbead86bde08a27aa"

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
