cask "pluminon" do
  version "2.0.2"
  sha256 "bf2758dfe6bc69a8c49cd0bb14248836e5912f3e7edc7733d46f102b27401012"

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
