cask "capgame" do
  version "0.1.0"
  sha256 "d175f4ae7d7d67e7ba931bd4573c0c1c7d4467c82737cd912fa844ff88144ece"

  url "https://github.com/Perfweb-net/record/releases/download/v#{version}/CapGame-#{version}-universal.dmg"
  name "CapGame"
  desc "Tampon circulaire d'enregistrement écran/son pour macOS"
  homepage "https://github.com/Perfweb-net/record"

  depends_on macos: ">= :ventura"

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
