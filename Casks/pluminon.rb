cask "pluminon" do
  version "2.0.4"
  sha256 "35a563dc98eec50e7325f391decfc14613dfe56a0e5d46263086ad37c260a7d2"

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
