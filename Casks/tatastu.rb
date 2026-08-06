# frozen_string_literal: true

cask "tatastu" do
  version "0.2.74"

  # Per-arch payloads. electron-builder names the arm64 DMG with an "-arm64"
  # suffix and the Intel (x64) DMG with NO arch suffix, so the URLs differ in
  # shape and each arch carries its own sha256. update-homebrew-cask.sh stamps
  # both hashes from the locally-built, notarized DMGs on release.
  on_arm do
    sha256 "9915d71411d7d4082faf7371962a24b9e5f3cf2b5da928e1f65e02e35c0649a3"

    url "https://cdn.tatastu.dev/Tatastu-#{version}-arm64.dmg"
  end
  on_intel do
    sha256 "2da35b1d03846b6e841990afa0af10c5c7019f4cd7d2deb8084f5e970be54f50"

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
