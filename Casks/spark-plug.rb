cask "spark-plug" do
  version "1.0.0"
  sha256 "b4bfbbaa2e16281a43c6c439f87cab402b8835a6a07a0f1b8df78fe3a6c438eb"

  url "https://github.com/kylescudder/spark-plug/releases/download/v#{version}/SparkPlug-#{version}.zip"
  name "Spark Plug"
  desc "Menubar launcher for Claude Code sessions in your worktrees"
  homepage "https://github.com/kylescudder/spark-plug"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "SparkPlug.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/SparkPlug.app"],
                   sudo: false
  end

  zap trash: "~/Library/Preferences/uk.co.crimsontide.SparkPlug.plist"
end
