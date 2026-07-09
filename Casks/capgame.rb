cask "capgame" do
  version "0.1.1"
  sha256 "be0c8002d309fe41e1ac675b63536ace9c447ce7687ff3b60045106c19089109"

  url "https://github.com/Perfweb-net/capgame-releases/releases/download/v#{version}/CapGame-#{version}-universal.dmg"
  name "CapGame"
  desc "Tampon circulaire d'enregistrement écran/son pour macOS"
  homepage "https://github.com/Perfweb-net/capgame-releases"

  depends_on macos: :ventura

  app "CapGame.app"

  zap trash: [
    "~/Library/Application Support/CapGame",
    "~/Library/Preferences/net.perfweb.capgame.plist",
    "~/Library/Saved Application State/net.perfweb.capgame.savedState"
  ]

  caveats <<~EOS
    CapGame n'est pas encore signé avec un certificat Apple Developer ID.
    Après l'installation, macOS bloquera l'ouverture ("app endommagée").
    Pour la débloquer, lance :
      xattr -cr /Applications/CapGame.app
  EOS
end
