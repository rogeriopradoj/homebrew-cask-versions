cask "little-snitch-nightly" do
  version "4.5,5457"
  sha256 "85806dc2588feb84aa1b462c3a95e2c7b198e4be06abe968b9f7b58701ff30a8"

  url "https://obdev.at/downloads/littlesnitch/nightly/LittleSnitch-#{version.before_comma}-nightly-(#{version.after_comma}).dmg"
  appcast "https://www.obdev.at/products/littlesnitch/releasenotes-nightly.html"
  name "Little Snitch Nightly Build"
  homepage "https://obdev.at/products/littlesnitch/download-nightly.html"

  auto_updates true
  conflicts_with cask: "little-snitch"
  depends_on macos: ">= :el_capitan"
  container type: :naked

  installer manual: "LittleSnitch-#{version.before_comma}-nightly-(#{version.after_comma}).dmg"

  uninstall launchctl: [
    "at.obdev.LittleSnitchUIAgent",
    "at.obdev.LittleSnitchHelper",
    "at.obdev.littlesnitchd",
  ]

  zap trash: [
    "/Library/Application Support/Objective Development/Little Snitch",
    "/Library/Caches/at.obdev.LittleSnitchConfiguration",
    "/Library/Little Snitch",
    "/Library/Logs/LittleSnitchDaemon.log",
    "~/Library/Application Support/Little Snitch",
    "~/Library/Caches/at.obdev.LittleSnitchAgent",
    "~/Library/Caches/at.obdev.LittleSnitchConfiguration",
    "~/Library/Caches/at.obdev.LittleSnitchHelper",
    "~/Library/Caches/at.obdev.LittleSnitchSoftwareUpdate",
    "~/Library/Caches/com.apple.helpd/Generated/at.obdev.LittleSnitchConfiguration.help*",
    "~/Library/Caches/com.apple.helpd/SDMHelpData/Other/English/HelpSDMIndexFile/at.obdev.LittleSnitchConfiguration.help*",
    "~/Library/Logs/Little Snitch Agent.log",
    "~/Library/Logs/Little Snitch Helper.log",
    "~/Library/Logs/Little Snitch Installer.log",
    "~/Library/Logs/Little Snitch Network Monitor.log",
    "~/Library/Preferences/at.obdev.LittleSnitchAgent.plist",
    "~/Library/Preferences/at.obdev.LittleSnitchConfiguration.plist",
    "~/Library/Preferences/at.obdev.LittleSnitchInstaller.plist",
    "~/Library/Preferences/at.obdev.LittleSnitchNetworkMonitor.plist",
    "~/Library/Preferences/at.obdev.LittleSnitchSoftwareUpdate.plist",
    "~/Library/Saved Application State/at.obdev.LittleSnitchInstaller.savedState",
    "~/Library/WebKit/at.obdev.LittleSnitchConfiguration",
    # These kext's should not be uninstalled by Cask
    "/Library/Extensions/LittleSnitch.kext",
    "/Library/StagedExtensions/Library/Extensions/LittleSnitch.kext",
  ],
      rmdir: "/Library/Application Support/Objective Development"

  caveats do
    kext
    reboot
  end
end
