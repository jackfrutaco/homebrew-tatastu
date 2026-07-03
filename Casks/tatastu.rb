# frozen_string_literal: true

cask "tatastu" do
  version "0.2.2"
  sha256 "ea002cc57b4e6b9e7ce8757e7a79316ae523d064603c93fc95c2b54bb498731b"

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
