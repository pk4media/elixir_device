defmodule Device.Parser do

  @empty_device   Application.fetch_env!(:device, :empty)
  @unknown_device Application.fetch_env!(:device, :unknown)

  @doc"""
  ## Examples

    iex> Device.Parser.parse(nil)
    :desktop
    iex> Device.Parser.parse("")
    :desktop
    iex> Device.Parser.parse("Mozilla/5.0 (X11; u; Linux; C) AppleWebKit /533.3 (Khtml, like Gheko) QtCarBrowser Safari /533.3")
    :car
    iex> Device.Parser.parse("Mozilla/5.0 (compatible; 008/0.83; http://www.80legs.com/webcrawler.html) Gecko/2008032620")
    :bot
  """
  @spec parse(String.t | nil) :: String.t
  def parse(nil) do
    @empty_device
  end
  def parse("") do
    parse(nil)
  end
  def parse(ua) when is_binary(ua) do
    ua = cond do
      String.match?(ua, ~r/FlipboardProxy/i) ->
        "FlipboardProxy/1.1;  http://flipboard.com/browserproxy"
      String.match?(ua, ~r/Applebot/i) ->
        "Applebot/0.1;  http://www.apple.com/go/applebot"
      true ->
        ua
    end

    cond do
      String.match?(ua, ~r/GoogleTV|SmartTV|SMART-TV|Internet TV|NetCast|NETTV|AppleTV|boxee|Kylo|Roku|DLNADOC|hbbtv|CrKey|CE\-HTML/i) ->
        :tv
      String.match?(ua, ~r/Xbox|PLAYSTATION (3|4)|Wii/i) ->
        :tv
      String.match?(ua, ~r/QtCarBrowser/i) ->
        :car
      String.match?(ua, ~r/Googlebot/i) ->
        :bot
      String.match?(ua, ~r/iP(a|ro)d/i) ->
        :tablet
      String.match?(ua, ~r/tablet/i) && !String.match?(ua, ~r/RX-34/i) ->
        :tablet
      String.match?(ua, ~r/FOLIO/i) ->
        :tablet
      String.match?(ua, ~r/Linux/i) && String.match?(ua, ~r/Android/i) && !String.match?(ua, ~r/Fennec|mobi|HTC Magic|HTCX06HT|Nexus One|SC-02B|fone 945/i) ->
        :tablet
      String.match?(ua, ~r/Kindle/i) ->
        :tablet
      String.match?(ua, ~r/Mac OS/i) && String.match?(ua, ~r/Silk/i) ->
        :tablet
      String.match?(ua, ~r/AppleWebKit/i) && String.match?(ua, ~r/Silk/i) && !String.match?(ua, ~r/Playstation Vita/i) ->
        :tablet
      String.match?(ua, ~r/GT-P10|SC-01C|SHW-M180S|SGH-T849|SCH-I800|SHW-M180L|SPH-P100|SGH-I987|zt180|HTC( Flyer|_Flyer)|Sprint ATP51|ViewPad7|pandigital(sprnova|nova)|Ideos S7|Dell Streak 7|Advent Vega|A101IT|A70BHT|MID7015|Next2|nook/i) ->
        :tablet
      String.match?(ua, ~r/MB511/i) && String.match?(ua, ~r/RUTEM/i) ->
        :tablet
      String.match?(ua, ~r/BOLT|Fennec|Iris|Maemo|Minimo|Mobi|mowser|NetFront|Novarra|Prism|RX-34|Skyfire|Tear|XV6875|XV6975|Google Wireless Transcoder/i) ->
        :phone
      String.match?(ua, ~r/Opera/i) && String.match?(ua, ~r/Windows NT 5/i) && String.match?(ua, ~r/HTC|Xda|Mini|Vario|SAMSUNG\-GT\-i8000|SAMSUNG\-SGH\-i9/i) ->
        :phone
      (String.match?(ua, ~r/Windows (NT|XP|ME|9)/) && !String.match?(ua, ~r/Phone/i)) && !String.match?(ua, ~r/Bot|Spider|ia_archiver|NewsGator/i) || String.match?(ua, ~r/Win( ?9|NT)/i) ->
        :desktop
      String.match?(ua, ~r/Macintosh|PowerPC/i) && !String.match?(ua, ~r/Silk/i) ->
        :desktop
      String.match?(ua, ~r/Linux/i) && String.match?(ua, ~r/X11/i) && !String.match?(ua, ~r/Charlotte|JobBot/i) ->
        :desktop
      String.match?(ua, ~r/CrOS/) ->
        :desktop
      String.match?(ua, ~r/Solaris|SunOS|BSD/i) ->
        :desktop
      String.match?(ua, ~r/Mozilla\/5\.0 \(\)|jack|Applebot|FlipboardProxy|Go 1.1 package|HTMLParser|simplereach|python-requests|ShowyouBot|MetaURI|nineconnections|(^Java\/[0-9._]*)|Commons-HttpClient|InAGist|HTTP-Java-Client|curl|Wget|Bot|B-O-T|Crawler|Spider|Spyder|Yahoo|ia_archiver|Covario-IDS|findlinks|DataparkSearch|larbin|Mediapartners-Google|NG-Search|Snappy|Teoma|Jeeves|Charlotte|NewsGator|TinEye|Cerberian|SearchSight|Zao|Scrubby|Qseero|PycURL|Pompos|oegp|SBIder|yoogliFetchAgent|yacy|webcollage|VYU2|voyager|updated|truwoGPS|StackRambler|Sqworm|silk|semanticdiscovery|ScoutJet|Nymesis|NetResearchServer|MVAClient|mogimogi|Mnogosearch|Arachmo|Accoona|holmes|htdig|ichiro|webis|LinkWalker|lwp-trivial|facebookexternalhit|monit\/|ELB-HealthChecker\/|JobBot|GoogleCloudMonitoring/i) && !String.match?(ua, ~r/phone|Playstation/i) ->
        :bot
      true ->
        @unknown_device
    end
  end
end
