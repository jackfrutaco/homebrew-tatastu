# frozen_string_literal: true

cask "tatastu" do
  version "0.2.61"

  # Per-arch payloads. electron-builder names the arm64 DMG with an "-arm64"
  # suffix and the Intel (x64) DMG with NO arch suffix, so the URLs differ in
  # shape and each arch carries its own sha256. update-homebrew-cask.sh stamps
  # both hashes from the locally-built, notarized DMGs on release.
  on_arm do
    sha256 "83d56f3af76c9b239c5a8ca3d07a966256e93afa77828c494ccbab81ff7f8cc8"

    url "https://cdn.tatastu.dev/Tatastu-#{version}-arm64.dmg"
  end
  on_intel do
    sha256 "54fa58600a2ffb0c3666a2bd0ac01fd55bb37c951b02552108693bc0136f51f0"

    url "https://cdn.tatastu.dev/Tatastu-#{version}.dmg"
  end

  name "Tatastu"
  desc "Local-first desktop app for AI-powered code assistance"
  homepage "https://tatastu.dev/"

  # The app's auto-updater (electron-updater) handles in-app updates.
  auto_updates true
  depends_on macos: :big_sur

  app "Tatastu.app"

  zap trash: [
    "~/Library/Application Support/Tatastu",
    "~/Library/Caches/dev.tatastu.app",
    "~/Library/HTTPStorages/dev.tatastu.app",
    "~/Library/Preferences/dev.tatastu.app.plist",
    "~/Library/Saved Application State/dev.tatastu.app.savedState",
  ]
end
