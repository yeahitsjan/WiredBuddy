cask "wiredbuddy" do
    version "0.1-fixsign"
    version :latest
    sha256 :no_check

    url "https://github.com/yeahitsjan/WiredBuddy/releases/download/#{version}/WiredBuddy.zip"
    name "Wired Buddy"
    desc "Menu bar application that shows ethernet status, but macOS style!"
    homepage "https://github.com/yeahitsjan/WiredBuddy"

    app "WiredBuddy.app"
    auto_updates false
end