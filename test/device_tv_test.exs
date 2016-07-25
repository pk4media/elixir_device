defmodule ElixirDeviceTvTest do
  use ExUnit.Case

  alias ElixirDevice.Parser

  @device "tv"

  @data [
    {"Kylo Browser", "Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.2) Gecko/20100222 Firefox/3.6 Kylo/0.8.4.74873"},
    {"Logitech Revue", "Mozilla/5.0 (X11; U; Linux i686; en-US) AppleWebKit/533.4 (KHTML, like Gecko) Chrome/5.0.375.127 Large Screen Safari/533.4 GoogleTV/b54202"},
    {"Nintendo Wii", "Opera/9.00 (Nintendo Wii"},
    {"Nintendo Wii", "Opera/9.30 (Nintendo Wii; U; ; 2047-7; en)"},
    {"Nintendo Wii", "Opera/9.10 (Nintendo Wii; U; ; 1621; en)"},
    {"Nintendo Wii", "Opera/9.00 (Nintendo Wii"},
    {"Nintendo Wii", "Opera/9.30 (Nintendo Wii; U; ; 2047-7; en)"},
    {"Nintendo Wii", "Opera/9.10 (Nintendo Wii; U; ; 1621; en)"},
    {"Nintendo Wii", "wii libnup/1.0"},
    {"Nintendo Wii", "Opera/9.30 (Nintendo Wii; U; ; 2047-7; en)"},
    {"Nintendo Wii", "Opera/9.10 (Nintendo Wii; U; ; 1621; en)"},
    {"Philips Net TV", "Opera/9.80 (Linux mips ; U; HbbTV/1.1.1 (; Philips; ; ; ; ) CE-HTML/1.0 NETTV/3.1.0; en) Presto/2.6.33 Version/10.70"},
    {"Philips Net TV", "Opera/9.80 (Linux armv6l ; U; CE-HTML/1.0 NETTV/3.0.1;; en) Presto/2.6.33 Version/10.60"},
    {"Philips Net TV", "Opera/9.70 (Linux armv6l ; U; CE-HTML/1.0 NETTV/2.0.2; en) Presto/2.2.1"},
    {"Philips Net TV", "Opera/9.70 (Linux mips ; U; CE-HTML/1.0 (); en) Presto/2.2.1"},
    {"Philips Net TV", "Opera 9.50 (Linux Mips; U; CE-HTML/1.0 (); en)"},
    {"Samsung SmartTV", "Mozilla/5.0 (SmartHub; SMART-TV; U; Linux/SmartTV) AppleWebKit/531.2+ (KHTML, Like Gecko) WebBrowser/1.0 SmartTV Safari/531.2+"},
    {"Sony Internet Box NSZGT1", "Mozilla/5.0 (X11; U: Linux i686; en-US) AppleWebKit/533.4 (KHTML, like Gecko) Chrome/5.0.375.127 Large Screen Safari/533.4 GoogleTV/162671"},
    {"Sony Playstation 3", "Mozilla/5.0 (PLAYSTATION 3; 3.55)"},
    {"Sony Playstation 3", "Mozilla/5.0 (PLAYSTATION 3; 2.00)"},
    {"Sony Playstation 3", "Mozilla/5.0 (PLAYSTATION 3; 1.90)"},
    {"Sony Playstation 3", "Mozilla/5.0 (PLAYSTATION 3; 1.70)"},
    {"Sony Playstation 3", "Mozilla/5.0 (PLAYSTATION 3; 1.5)"},
    {"Sony Playstation 3", "Mozilla/5.0 (PLAYSTATION 3; 1.10)"},
    {"Sony Playstation 3", "Mozilla/5.0 (PLAYSTATION 3; 1.00)"},
    {"Sony Playstation 3", "Mozilla/4.0 (PS3 (PlayStation 3); 1.00)"},
    {"HbbTV smart tv", "Opera/9.80 (Linux armv7l; HbbTV/1.1.1 (; Sony; KDL32W655A; PKG3.802EUA; 2013;); ) Presto/2.12.362 Version/12.11"},
    {"Playstation 4", "Mozilla/5.0 (PlayStation 4 1.000) AppleWebKit/536.26 (KHTML, like Gecko)"},
    {"Chromecast", "CrKey"},
    {"Samsung smart tv", "Mozilla/5.0 (SMART-TV; Linux; Tizen 2.3) AppleWebkit/538.1 (KHTML, like Gecko) SamsungBrowser/1.0 TV Safari/538.1"},
    {"TV device type check with is method", "PlayStation 3"}
  ]

  test "tvs" do
    @data
    |> Enum.each(fn({device, ua}) ->
      detected = Parser.parse(ua)
      assert(detected == @device, "#{device} detected as #{detected} for #{ua}")
    end)
  end
end
