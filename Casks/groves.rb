cask "groves" do
  version "1.2.0"
  sha256 "b15be4f7849b69b0d4fce80fa64e2dbf41979a223c9e6f9730e6a647153e8f48"

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
