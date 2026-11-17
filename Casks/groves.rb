cask "groves" do
  version "1.2.4"
  sha256 "24077eb7e08c2a498977579964ae9a1477a38c3be0dfab75ca158fca077a7533"

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
