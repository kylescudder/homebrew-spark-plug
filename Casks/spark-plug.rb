cask "spark-plug" do
  version "1.0.2"
  sha256 "b66e834fee7d19d427bdd8dae150027f94c58ff011cf212f60f9740f55449226"

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
