defmodule ParserBench do
  use Benchfella

  bench "empty ua" do
    Device.Parser.parse(nil)
  end

  bench "car ua" do
    Device.Parser.parse("Mozilla/5.0 (X11; u; Linux; C) AppleWebKit /533.3 (Khtml, like Gheko) QtCarBrowser Safari /533.3")
  end

  bench "phone ua" do
    Device.Parser.parse("Mozilla/5.0 (iPhone Simulator; U; CPU iPhone OS 4_0 like Mac OS X; en-us) AppleWebKit/525.18.1 (KHTML, like Gecko)")
  end

  bench "bot ua" do
    Device.Parser.parse("Mozilla/5.0 (compatible; 008/0.83; http://www.80legs.com/webcrawler.html) Gecko/2008032620")
  end
end
