cask "groves" do
  version "1.2.5"
  sha256 "7c0dda55ffb2fc358699e32380c738247398b07410174e367e4fb9302fb71a93"

  url "https://github.com/francisswiftbuilder/Groves/releases/download/v#{version}/Groves-#{version}.dmg"
  name "Groves"
  desc "Native Git client for visual repository management"
  homepage "https://github.com/francisswiftbuilder/Groves"

  depends_on macos: :tahoe

  app "Groves.app"

  caveats <<~EOS
    Groves is currently ad-hoc signed. On first launch, macOS may block the app
    because it cannot verify the developer. After attempting to open Groves,
    go to System Settings → Privacy & Security and choose Open Anyway.
  EOS
end
