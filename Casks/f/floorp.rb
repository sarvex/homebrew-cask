cask "floorp" do
  version "11.24.0"
  sha256 "0e3add70e23af30561778749a4add77963b625f3f35ea0d898d71d4fdc677555"

  url "https://github.com/Floorp-Projects/Floorp/releases/download/v#{version}/floorp-macOS-universal.dmg",
      verified: "github.com/Floorp-Projects/Floorp/"
  name "Floorp browser"
  desc "Privacy-focused Firefox-based browser"
  homepage "https://floorp.app/"

  livecheck do
    url "https://floorp-update.ablaze.one/browser/10.8.0/Darwin/aarch64/update.xml"
    strategy :xml do |xml|
      xml.get_elements("//update").map { |item| item.attributes["displayVersion"] }
    end
  end

  auto_updates true
  depends_on macos: ">= :catalina"

  app "Floorp.app"

  zap trash: [
        "~/Library/Application Support/Floorp",
        "~/Library/Caches/Floorp",
        "~/Library/Caches/Mozilla/updates/Applications/Floorp",
        "~/Library/Preferences/*.floorp.plist",
        "~/Library/Saved Application State/*.floorp.savedState",
      ],
      rmdir: "~/Library/Caches/Mozilla"
end
