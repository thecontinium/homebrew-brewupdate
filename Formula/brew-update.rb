class BrewUpdate < Formula
  homepage 'https://github.com/thecontinium/homebrew-brewupdate/'
  url 'https://github.com/thecontinium/homebrew-brewupdate.git'
  version '0.0.1'

  skip_clean 'bin'

  depends_on "terminal-notifier"


  def install
    bin.install 'homebrewupdate'
  end

  plist_options :startup => true

  def plist; <<-EOS.undent
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
    <dict>
    	<key>Label</key>
      <string>#{plist_name}</string>
    	<key>ProgramArguments</key>
	    <array>
		    <string>/usr/local/bin/homebrewupdate</string>
	    </array>
	    <key>StandardErrorPath</key>
	    <string>/dev/null</string>
	    <key>StandardOutPath</key>
	    <string>/dev/null</string>
	    <key>StartCalendarInterval</key>
	    <array>
		    <dict>
			    <key>Hour</key>
			    <integer>21</integer>
			    <key>Minute</key>
			    <integer>0</integer>
		    </dict>
		    <dict>
		    	<key>Hour</key>
		    	<integer>9</integer>
			    <key>Minute</key>
			    <integer>0</integer>
		    </dict>
	    </array>
    </dict>
    </plist>
    EOS
  end
end
