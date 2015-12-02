#!/bin/bash -ex

# homebrew
ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"
brew install git
brew update
brew doctor

# tools
brew install tree pstree vim heroku-toolbelt watch irssi sqlite nmap
brew install https://raw.github.com/gist/61fd684d2dc50634aa5a/wit.rb

sudo chsh -s `which zsh` `whoami`

# ruby
brew install rbenv ruby_build rbenv-binstubs
rbenv install -k 1.9.3-p374
rbenv global 1.9.3-p374
eval "$(rbenv init -)"
hash -r
gem install bundler 

# change.org
sudo tee -a /etc/hosts >/dev/null <<EOF
##
# Host Database
#
# localhost is used to configure the loopback interface
# when the system is booting.  Do not change this entry.
##
127.0.0.1       localhost
255.255.255.255 broadcasthost
::1             localhost
fe80::1%lo0     localhost

127.0.0.1  www.local-change.org local-change.org e.local-change.org www.local-s3.org
EOF

brew install mysql redis mongodb memcached chromedriver imagemagick
brew install sphinx --mysql
ln -sfv /usr/local/opt/{memcached,redis,mysql,mongodb}/*.plist ~/Library/LaunchAgents
launchctl load -w ~/Library/LaunchAgents/homebrew*.plist

# preferences
ruby -ryaml <<EOF
YAML.load(<<PREFS
NSGlobalDomain:
  AppleKeyboardUIMode: 3
  KeyRepeat: 0
  InitialKeyRepeat: 12
com.apple.driver.AppleBluetoothMultitouch.mouse:
  MouseButtonMode: TwoButton
com.apple.finder:
  NewWindowTarget: PfHm
  NewWindowTargetPath: file://localhost/Users/chase/
  FXDefaultSearchScope: SCcf
com.apple.dock:
  persistent-apps: []
  persistent-others: []
  autohide: 1
  dashboard-in-overlay: 1
  mru-spaces: 0
com.apple.menuextra.clock:
  DateFormat: EEE MMM d  h:mm a
com.apple.frameworks.diskimages:
  skip-verify: true
  skip-verify-locked: true
  skip-verify-remote: true
com.googlecode.iterm2:
  LoadPrefsFromCustomFolder: 1
  PrefsCustomFolder: /Users/chase/Drive/etc
com.manytricks.Moom:
  Application Mode: 2
  Custom Controls: []
  Dismiss After Filling: 1
  "Key Control: Arrow": 12
  "Key Control: Arrow: Command": 31
  "Key Control: Arrow: Control": 0
  "Key Control: Arrow: Option": 41
  Keyboard Controls Grid: 1
  Mouse Controls Include Custom Controls: 1
  "Mouse Controls Include Custom Controls: Show On Hover": 1
  SUEnableAutomaticChecks: 1
  snap: 1
PREFS
).each_pair do |domain, prefs|
  prefs.each_pair do |pref, value|
    case value
    when String
      system "defaults write #{domain} \"#{pref}\" -string \"#{value}\""
    when Integer
      system "defaults write #{domain} \"#{pref}\" -int #{value}"
    when Array
      system "defaults write #{domain} \"#{pref}\" -array" if value.empty?
    when TrueClass,FalseClass
      system "defaults write #{domain} \"#{pref}\" -bool #{value}"
    end
  end
end
EOF

# dotfiles
mkdir -p ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User
ruby ~/Drive/dot/bin/link-dotfiles
chmod u+x ~/.bin/{link-dotfiles,git-prompt}
ssh-add -K ~/.ssh/*.pem
ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" /usr/local/bin/subl
mkdir -p ~/Library/Application\ Support/Sublime\ Text\ 3/Packages
pushd ~/Library/Application\ Support/Sublime\ Text\ 3/Packages
  git clone git://github.com/chasetopher/sublime-file-operations.git "File Operations"
  git clone git://github.com/buymeasoda/soda-theme "Theme - Soda"
popd

