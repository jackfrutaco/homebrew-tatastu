# frozen_string_literal: true

cask "tatastu" do
  version "0.1.59"
  sha256 "1e2fe9a4675d3be6afcb0af2deed408147d4a6435bbe37c030f313ff83dcdd6e"

  url "https://cdn.tatastu.dev/Tatastu-#{version}-arm64.dmg"
  name "Tatastu"
  desc "Local-first desktop app for AI-powered code assistance"
  homepage "https://tatastu.dev/"

  # The app's auto-updater (electron-updater) handles in-app updates.
  auto_updates true
  # Tatastu ships an arm64-only build. There is no Intel/x64 DMG.
  depends_on arch:  :arm64
  depends_on macos: ">= :big_sur"

  app "Tatastu.app"

  zap trash: [
    "~/Library/Application Support/Tatastu",
    "~/Library/Caches/dev.tatastu.app",
    "~/Library/HTTPStorages/dev.tatastu.app",
    "~/Library/Preferences/dev.tatastu.app.plist",
    "~/Library/Saved Application State/dev.tatastu.app.savedState",
  ]
end
