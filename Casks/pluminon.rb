cask "pluminon" do
  version "1.3.2"
  sha256 "29fe2161ac8e8d8dae66a795e78a05f2ca9c9cf93011a14d6621ba6618988c57"

  url "https://github.com/francisswiftbuilder/pluminon/releases/download/v#{version}/Groves-#{version}.dmg"
  name "PLUMINON"
  desc "Native Git client for visual repository management"
  homepage "https://github.com/francisswiftbuilder/pluminon"

  depends_on macos: :tahoe

  app "Groves.app"

  caveats <<~EOS
    PLUMINON is currently ad-hoc signed. On first launch, macOS may block the app
    because it cannot verify the developer. After attempting to open Groves,
    go to System Settings → Privacy & Security and choose Open Anyway.
  EOS
end
