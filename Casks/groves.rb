cask "groves" do
  version "1.2.1"
  sha256 "ad06379e668338be2afe81828fb54f668378fa9e5dd50a8502692bc777ede26c"

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
