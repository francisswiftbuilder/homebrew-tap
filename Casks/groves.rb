cask "groves" do
  version "1.3.1"
  sha256 "91377e0a7b881346ab748193f7c8c911ac90e04488693dc5746aa7158c4000fb"

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
