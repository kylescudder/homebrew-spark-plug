cask "spark-plug" do
  version "1.0.1"
  sha256 "688df3efe20acddc86f92c543a0529c8ddb2d849d04c0ee6ff720b9616a48ad9"

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
