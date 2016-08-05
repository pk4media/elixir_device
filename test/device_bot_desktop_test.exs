defmodule DeviceBotTest do
  use ExUnit.Case

  alias Device.Parser

  @device :bot

  @data [
    {"008 0.83", "Mozilla/5.0 (compatible; 008/0.83; http://www.80legs.com/webcrawler.html) Gecko/2008032620"},
    {"ABACHOBot", "ABACHOBot"},
    {"Accoona-AI-Agent 1.1.1", "Accoona-AI-Agent/1.1.1 (crawler at accoona dot com)"},
    {"Accoona-AI-Agent 1.1.2", "Accoona-AI-Agent/1.1.2 (aicrawler at accoonabot dot com)"},
    {"AddSugarSpiderBot", "Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0) AddSugarSpiderBot www.idealobserver.com"},
    {"Alexa Web crawler ia_archiver", "ia_archiver"},
    {"Alexa Web crawler ia_archiver 8.0", "ia_archiver/8.0 (Windows 2.4; en-US;)"},
    {"Alexa Web crawler ia_archiver 8.1", "ia_archiver/8.1 (Windows 2000 1.9; en-US;)"},
    {"Alexa Web crawler ia_archiver 8.2", "ia_archiver/8.2 (Windows 7.6; en-US;)"},
    {"Alexa Web crawler ia_archiver 8.8", "ia_archiver/8.8 (Windows XP 7.2; en-US;)"},
    {"Alexa Web crawler ia_archiver 8.8", "ia_archiver/8.8 (Windows XP 3.0; en-US;)"},
    {"Alexa Web crawler ia_archiver 8.9", "ia_archiver/8.9 (Windows NT 3.1; en-US;)"},
    {"Alexa Web crawler ia_archiver 8.9", "ia_archiver/8.9 (Windows 3.9; en-US;)"},
    {"Alexa Web crawler ia_archiver 8.9", "ia_archiver/8.9 (Linux 1.0; en-US;)"},
    {"AnyApexBot 1.0", "Mozilla/5.0 (compatible; AnyApexBot/1.0; +http://www.anyapex.com/bot.html)"},
    {"Baiduspider", "Baiduspider+(+http://www.baidu.com/search/spider_jp.html)"},
    {"Baiduspider", "Baiduspider+(+http://www.baidu.com/search/spider.htm)"},
    {"Baiduspider", "BaiDuSpider"},
    {"BecomeBot 2.3", "Mozilla/5.0 (compatible; BecomeBot/2.3; MSIE 6.0 compatible; +http://www.become.com/site_owners.html)"},
    {"BecomeBot 3.0", "Mozilla/5.0 (compatible; BecomeBot/3.0; MSIE 6.0 compatible; +http://www.become.com/site_owners.html)"},
    {"BeslistBot 1.0", "Mozilla/5.0 (compatible; BeslistBot; nl; BeslistBot 1.0; http://www.beslist.nl/"},
    {"BillyBobBot 1.0", "BillyBobBot/1.0 (+http://www.billybobbot.com/crawler/)"},
    {"Bimbot 1.0", "Bimbot/1.0"},
    {"Bingbot 2.0", "Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)"},
    {"Bingbot 2.0", "Mozilla/5.0 (compatible; bingbot/2.0 +http://www.bing.com/bingbot.htm)"},
    {"BlitzBot", "Mozilla/4.0 (compatible; BlitzBot)"},
    {"BlitzBot", "BlitzBOT@tricus.net (Mozilla compatible)"},
    {"BlitzBot", "BlitzBOT@tricus.com (Mozilla compatible)"},
    {"boitho.com-dc 0.79", "boitho.com-dc/0.79 ( http://www.boitho.com/dcbot.html )"},
    {"boitho.com-dc 0.81", "boitho.com-dc/0.81 ( http://www.boitho.com/dcbot.html )"},
    {"boitho.com-dc 0.82", "boitho.com-dc/0.82 ( http://www.boitho.com/dcbot.html )"},
    {"boitho.com-dc 0.83", "boitho.com-dc/0.83 ( http://www.boitho.com/dcbot.html )"},
    {"boitho.com-dc 0.85", "boitho.com-dc/0.85 ( http://www.boitho.com/dcbot.html )"},
    {"boitho.com-robot 1.0", "boitho.com-robot/1.0"},
    {"boitho.com-robot 1.1", "boitho.com-robot/1.1"},
    {"btbot 0.4", "btbot/0.4 (+http://www.btbot.com/btbot.html)"},
    {"CatchBot 1.0", "CatchBot/1.0; +http://www.catchbot.com"},
    {"CatchBot 1.0", "CatchBot/1.0; http://www.catchbot.com"},
    {"CatchBot 2.0", "CatchBot/2.0; +http://www.catchbot.com"},
    {"Charlotte 0.9t", "Mozilla/5.0 (X11; U; Linux i686 (x86_64); en-US; rv:1.8.1.11) Gecko/20080109 (Charlotte/0.9t; http://www.searchme.com/support/) (Charlotte/0.9t; http://www.searchme.com/support/)"},
    {"Charlotte 0.9t", "Mozilla/5.0 (X11; U; Linux i686 (x86_64); en-US; rv:1.8.1.11) Gecko/20080109 (Charlotte/0.9t; http://www.searchme.com/support/)"},
    {"Charlotte 1.0b", "Mozilla/5.0 (compatible; Charlotte/1.0b; http://www.betaspider.com/)"},
    {"ConveraCrawler 0.9", "ConveraCrawler/0.9 (+http://www.authoritativeweb.com/crawl)"},
    {"ConveraCrawler 0.9d", "ConveraCrawler/0.9d (+http://www.authoritativeweb.com/crawl)"},
    {"ConveraCrawler 0.9d", "ConveraCrawler/0.9d ( http://www.authoritativeweb.com/crawl)"},
    {"ConveraCrawler 0.9e", "ConveraCrawler/0.9e (+http://ews.converasearch.com/crawl.htm)"},
    {"cosmos 0.9", "cosmos/0.9_(robot@xyleme.com)"},
    {"Covario IDS 1.0", "Covario-IDS/1.0 (Covario; http://www.covario.com/ids; support at covario dot com)"},
    {"DataparkSearch 4.35", "DataparkSearch/4.35-02122005 ( http://www.dataparksearch.org/)"},
    {"DataparkSearch 4.35", "DataparkSearch/4.35 ( http://www.dataparksearch.org/)"},
    {"DataparkSearch 4.36", "DataparkSearch/4.36 ( http://www.dataparksearch.org/)"},
    {"DataparkSearch 4.37", "DataparkSearch/4.37-23012006 ( http://www.dataparksearch.org/)"},
    {"DiamondBot", "DiamondBot"},
    {"Discobot 1.0", "Mozilla/5.0 (compatible; discobot/1.0; +http://discoveryengine.com/discobot.html)"},
    {"Dotbot 1.0", "Mozilla/5.0 (compatible; DotBot/1.1; http://www.dotnetdotcom.org/, crawler@dotnetdotcom.org)"},
    {"Dotbot 1.0.1", "DotBot/1.0.1 (http://www.dotnetdotcom.org/#info, crawler@dotnetdotcom.org)"},
    {"Dotbot 1.1", "Mozilla/5.0 (compatible; DotBot/1.1; http://www.dotnetdotcom.org/, crawler@dotnetdotcom.org)"},
    {"EmeraldShield.com WebBot", "EmeraldShield.com WebBot (http://www.emeraldshield.com/webbot.aspx)"},
    {"envolk[ITS]spider 1.6", "envolk[ITS]spider/1.6 (+http://www.envolk.com/envolkspider.html)"},
    {"envolk[ITS]spider 1.6", "envolk[ITS]spider/1.6 ( http://www.envolk.com/envolkspider.html)"},
    {"EsperanzaBot", "EsperanzaBot(+http://www.esperanza.to/bot/)"},
    {"Exabot 2.0", "Exabot/2.0"},
    {"FAST Enterprise Crawler 6", "FAST Enterprise Crawler 6 used by Schibsted (webcrawl@schibstedsok.no)"},
    {"FAST Enterprise Crawler 6", "FAST Enterprise Crawler 6 / Scirus scirus-crawler@fast.no; http://www.scirus.com/srsapp/contactus/"},
    {"FAST Enterprise Crawler 6", "FAST Enteprise Crawler/6 (www dot fastsearch dot com)"},
    {"FAST-WebCrawler 3.6", "FAST-WebCrawler/3.6/FirstPage (atw-crawler at fast dot no;http://fast.no/support/crawler.asp)"},
    {"FAST-WebCrawler 3.6", "FAST-WebCrawler/3.6 (atw-crawler at fast dot no; http://fast.no/support/crawler.asp)"},
    {"FAST-WebCrawler 3.6", "FAST-WebCrawler/3.6"},
    {"FAST-WebCrawler 3.7", "FAST-WebCrawler/3.7/FirstPage (atw-crawler at fast dot no;http://fast.no/support/crawler.asp)"},
    {"FAST-WebCrawler 3.7", "FAST-WebCrawler/3.7 (atw-crawler at fast dot no; http://fast.no/support/crawler.asp)"},
    {"FAST-WebCrawler 3.8", "FAST-WebCrawler/3.8 (atw-crawler at fast dot no; http://fast.no/support/crawler.asp)"},
    {"FAST-WebCrawler 3.x", "FAST-WebCrawler/3.x Multimedia (mm dash crawler at fast dot no)"},
    {"FAST-WebCrawler 3.x", "FAST-WebCrawler/3.x Multimedia"},
    {"FDSE robot", "Mozilla/4.0 (compatible: FDSE robot)"},
    {"FindLinks 1.0", "findlinks/1.0 (+http://wortschatz.uni-leipzig.de/findlinks/)"},
    {"FindLinks 1.0.8", "findlinks/1.0.8 (+http://wortschatz.uni-leipzig.de/findlinks/)"},
    {"FindLinks 1.0.9", "findlinks/1.0.9 (+http://wortschatz.uni-leipzig.de/findlinks/)"},
    {"FindLinks 1.06", "findlinks/1.06 (+http://wortschatz.uni-leipzig.de/findlinks/)"},
    {"FindLinks 1.1", "findlinks/1.1 (+http://wortschatz.uni-leipzig.de/findlinks/)"},
    {"FindLinks 1.1-a3", "findlinks/1.1-a3 (+http://wortschatz.uni-leipzig.de/findlinks/)"},
    {"FindLinks 1.1-a4", "findlinks/1.1-a4 (+http://wortschatz.uni-leipzig.de/findlinks/)"},
    {"FindLinks 1.1-a5", "findlinks/1.1-a5 (+http://wortschatz.uni-leipzig.de/findlinks/)"},
    {"FindLinks 1.1-a7", "findlinks/1.1-a7 (+http://wortschatz.uni-leipzig.de/findlinks/)"},
    {"FindLinks 1.1-a8", "findlinks/1.1-a8 (+http://wortschatz.uni-leipzig.de/findlinks/)"},
    {"FindLinks 1.1-a8", "findlinks/1.1-a8 ( http://wortschatz.uni-leipzig.de/findlinks/)"},
    {"FindLinks 1.1-a9", "findlinks/1.1-a9 (+http://wortschatz.uni-leipzig.de/findlinks/)"},
    {"FindLinks 1.1.1", "findlinks/1.1.1 (+http://wortschatz.uni-leipzig.de/findlinks/)"},
    {"FindLinks 1.1.1-a1", "findlinks/1.1.1-a1 (+http://wortschatz.uni-leipzig.de/findlinks/)"},
    {"FindLinks 1.1.1-a5", "findlinks/1.1.1-a5 (+http://wortschatz.uni-leipzig.de/findlinks/)"},
    {"FindLinks 1.1.2-a5", "findlinks/1.1.2-a5 (+http://wortschatz.uni-leipzig.de/findlinks/)"},
    {"FindLinks 1.1.3-beta1", "findlinks/1.1.3-beta1 (+http://wortschatz.uni-leipzig.de/findlinks/)"},
    {"FindLinks 1.1.3-beta2", "findlinks/1.1.3-beta2 (+http://wortschatz.uni-leipzig.de/findlinks/)"},
    {"FindLinks 1.1.3-beta4", "findlinks/1.1.3-beta4 (+http://wortschatz.uni-leipzig.de/findlinks/)"},
    {"FindLinks 1.1.3-beta6", "findlinks/1.1.3-beta6 (+http://wortschatz.uni-leipzig.de/findlinks/)"},
    {"FindLinks 1.1.3-beta8", "findlinks/1.1.3-beta8 (+http://wortschatz.uni-leipzig.de/findlinks/)"},
    {"FindLinks 1.1.3-beta9", "findlinks/1.1.3-beta9 (+http://wortschatz.uni-leipzig.de/findlinks/)"},
    {"FindLinks 1.1.4-beta1", "findlinks/1.1.4-beta1 (+http://wortschatz.uni-leipzig.de/findlinks/)"},
    {"FindLinks 1.1.5-beta7", "findlinks/1.1.5-beta7 (+http://wortschatz.uni-leipzig.de/findlinks/)"},
    {"FindLinks 1.1.6-beta1", "findlinks/1.1.6-beta1 (+http://wortschatz.uni-leipzig.de/findlinks/)"},
    {"FindLinks 1.1.6-beta4", "findlinks/1.1.6-beta4 (+http://wortschatz.uni-leipzig.de/findlinks/)"},
    {"FindLinks 1.1.6-beta6", "findlinks/1.1.6-beta6 (+http://wortschatz.uni-leipzig.de/findlinks/)"},
    {"FindLinks 2.0.1", "findlinks/2.0.1 (+http://wortschatz.uni-leipzig.de/findlinks/)"},
    {"FurlBot Furl Search 2.0", "Mozilla/4.0 compatible FurlBot/Furl Search 2.0 (FurlBot; http://www.furl.net; wn.furlbot@looksmart.net)"},
    {"FyberSpider", "FyberSpider (+http://www.fybersearch.com/fyberspider.php)"},
    {"FyberSpider", "FyberSpider"},
    {"g2crawler", "g2Crawler nobody@airmail.net"},
    {"Gaisbot 3.0", "Gaisbot/3.0 (jerry_wu@openfind.com.tw; http://gais.cs.ccu.edu.tw/robot.php)"},
    {"Gaisbot 3.0+", "Gaisbot/3.0+(robot06@gais.cs.ccu.edu.tw;+http://gais.cs.ccu.edu.tw/robot.php)"},
    {"GalaxyBot 1.0", "GalaxyBot/1.0 (http://www.galaxy.com/galaxybot.html)"},
    {"genieBot", "genieBot (http://64.5.245.11/faq/faq.html)"},
    {"genieBot", "genieBot ((http://64.5.245.11/faq/faq.html))"},
    {"Gigabot 1.0", "Gigabot/1.0"},
    {"Gigabot 2.0", "Gigabot/2.0/gigablast.com/spider.html"},
    {"Gigabot 2.0", "Gigabot/2.0 (http://www.gigablast.com/spider.html)"},
    {"Gigabot 2.0", "Gigabot/2.0"},
    {"Gigabot 3.0", "Gigabot/3.0 (http://www.gigablast.com/spider.html)"},
    {"Girafabot", "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.2; SV1; .NET CLR 1.1.4322; Girafabot [girafa.com])"},
    {"Girafabot", "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 4.0; Girafabot; girafabot at girafa dot com; http://www.girafa.com)"},
    {"Girafabot", "Mozilla/4.0 (compatible; MSIE 5.0; Windows NT; Girafabot; girafabot at girafa dot com; http://www.girafa.com)"},
    {"Googlebot 2.1", "Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)"},
    {"Googlebot 2.1", "Googlebot/2.1 (+http://www.googlebot.com/bot.html)"},
    {"Googlebot 2.1", "Googlebot/2.1 (+http://www.google.com/bot.html)"},
    {"Googlebot-Image 1.0", "Googlebot-Image/1.0"},
    {"GurujiBot 1.0", "Mozilla/5.0 GurujiBot/1.0 (+http://www.guruji.com/en/WebmasterFAQ.html)"},
    {"GurujiBot 1.0", "Mozilla/5.0 GurujiBot/1.0 ( http://www.guruji.com/en/WebmasterFAQ.html)"},
    {"GurujiBot 1.0", "Mozilla/5.0 (compatible; GurujiBot/1.0; +http://www.guruji.com/en/WebmasterFAQ.html)"},
    {"GurujiBot 1.0", "GurujiBot/1.0 (+http://www.guruji.com/WebmasterFAQ.html)"},
    {"GurujiBot 1.0", "GurujiBot/1.0 (+http://www.guruji.com/en/WebmasterFAQ.html)"},
    {"HappyFunBot 1.1", "HappyFunBot/1.1 ( http://www.happyfunsearch.com/bot.html)"},
    {"hl_ftien_spider", "hl_ftien_spider"},
    {"hl_ftien_spider 1.1", "hl_ftien_spider_v1.1"},
    {"Holmes 3.12.1", "holmes/3.12.1 (http://morfeo.centrum.cz/bot)"},
    {"Holmes 3.12.2", "holmes/3.12.2 (http://morfeo.centrum.cz/bot)"},
    {"Holmes 3.12.3", "holmes/3.12.3 (http://morfeo.centrum.cz/bot)"},
    {"Holmes 3.12.4", "holmes/3.12.4 (http://morfeo.centrum.cz/bot)"},
    {"iaskspider", "iaskspider"},
    {"iaskspider 2.0", "iaskspider/2.0(+http://iask.com/help/help_index.html)"},
    {"iCCrawler", "iCCrawler (http://www.iccenter.net/bot.htm)"},
    {"ichiro 2.0", "ichiro/2.0+(http://help.goo.ne.jp/door/crawler.html)"},
    {"ichiro 2.0", "ichiro/2.0 (http://help.goo.ne.jp/door/crawler.html)"},
    {"ichiro 3.0", "ichiro/3.0 (http://help.goo.ne.jp/door/crawler.html)"},
    {"ichiro 4.0", "ichiro/4.0 (http://help.goo.ne.jp/door/crawler.html)"},
    {"IRLbot 2.0", "IRLbot/2.0 (compatible; MSIE 6.0; http://irl.cs.tamu.edu/crawler)"},
    {"IRLbot 2.0", "IRLbot/2.0 (+http://irl.cs.tamu.edu/crawler)"},
    {"IRLbot 2.0", "IRLbot/2.0 ( http://irl.cs.tamu.edu/crawler)"},
    {"IRLbot 3.0", "IRLbot/3.0 (compatible; MSIE 6.0; http://irl.cs.tamu.edu/crawler/)"},
    {"IRLbot 3.0", "IRLbot/3.0 (compatible; MSIE 6.0; http://irl.cs.tamu.edu/crawler)"},
    {"IssueCrawler", "IssueCrawler"},
    {"Jaxified Bot", "Jaxified Bot (+http://www.jaxified.com/crawler/)"},
    {"Jyxobot 1", "Jyxobot/1"},
    {"KoepaBot", "Mozilla/5.0 (compatible; KoepaBot BETA; http://www.koepa.nl/bot.html)"},
    {"LapozzBot 1.4", "LapozzBot/1.4 (+http://robot.lapozz.com)"},
    {"Larbin", "larbin_test nobody@airmail.etn"},
    {"Larbin", "larbin_test (nobody@airmail.etn)"},
    {"Larbin", "LARBIN-EXPERIMENTAL efp@gmx.net"},
    {"Larbin 2.3.6", "larbin_2.6.3 tangyi858@163.com"},
    {"Larbin 2.3.6", "larbin_2.6.3 ltaa_web_crawler@groupes.epfl.ch"},
    {"Larbin 2.3.6", "larbin_2.6.3 larbin2.6.3@unspecified.mail"},
    {"Larbin 2.3.6", "larbin_2.6.3 gqnmgsp@ruc.edu.cn"},
    {"Larbin 2.3.6", "larbin_2.6.3 ghary@sohu.com"},
    {"Larbin 2.3.6", "larbin_2.6.3 capveg@cs.umd.edu"},
    {"Larbin 2.5.0", "larbin_2.5.0 (larbin2.5.0@unspecified.mail)"},
    {"Larbin 2.6.2", "larbin_2.6.2 vitalbox1@hotmail.com"},
    {"Larbin 2.6.2", "larbin_2.6.2 pierre@micro-fun.ch"},
    {"Larbin 2.6.2", "larbin_2.6.2 listonATccDOTgatechDOTedu"},
    {"Larbin 2.6.2", "larbin_2.6.2 larbin@correa.org"},
    {"Larbin 2.6.2", "larbin_2.6.2 larbin2.6.2@unspecified.mail"},
    {"Larbin 2.6.2", "larbin_2.6.2 kalou@kalou.net"},
    {"Larbin 2.6.2", "larbin_2.6.2 dthunen@princeton.edu"},
    {"Larbin 2.6.2", "larbin_2.6.2 (vitalbox1@hotmail.com)"},
    {"Larbin 2.6.2", "larbin_2.6.2 (pierre@micro-fun.ch)"},
    {"Larbin 2.6.2", "larbin_2.6.2 (larbin@correa.org)"},
    {"Larbin 2.6.2", "larbin_2.6.2 (larbin2.6.2@unspecified.mail)"},
    {"Larbin 2.6.2", "larbin_2.6.1 larbin2.6.1@unspecified.mail"},
    {"Larbin 2.6.3", "larbin_2.6.3 zumesun@hotmail.com"},
    {"Larbin 2.6.3", "larbin_2.6.3 (wgao@genieknows.com)"},
    {"Larbin 2.6.3", "larbin_2.6.3 (ltaa_web_crawler@groupes.epfl.ch)"},
    {"Larbin 2.6.3", "larbin_2.6.3 (larbin@behner.org)"},
    {"Larbin 2.6.3", "larbin_2.6.3 (larbin2.6.3@unspecified.mail)"},
    {"Larbin 2.6.3", "larbin_xy250 larbin2.6.3@unspecified.mail"},
    {"Larbin 5.0", "Mozilla/5.0 larbin@unspecified.mail"},
    {"LDSpider", "ldspider (http://code.google.com/p/ldspider/wiki/Robots)"},
    {"LexxeBot", "LexxeBot/1.0 (lexxebot@lexxe.com)"},
    {"Linguee Bot", "Linguee Bot (http://www.linguee.com/bot; bot@linguee.com)"},
    {"lmspider", "lmspider lmspider@scansoft.com"},
    {"lmspider", "lmspider (lmspider@scansoft.com)"},
    {"Mediapartners-Google 2.1", "Mediapartners-Google/2.1"},
    {"MJ12bot 1.0.5", "MJ12bot/v1.0.5 (http://majestic12.co.uk/bot.php?+)"},
    {"MJ12bot 1.0.6", "MJ12bot/v1.0.6 (http://majestic12.co.uk/bot.php?+)"},
    {"MJ12bot 1.0.7", "MJ12bot/v1.0.7 (http://majestic12.co.uk/bot.php?+)"},
    {"MJ12bot 1.0.8", "MJ12bot/v1.0.8 (http://majestic12.co.uk/bot.php?+)"},
    {"MJ12bot 1.2.3", "Mozilla/5.0 (compatible; MJ12bot/v1.2.3; http://www.majestic12.co.uk/bot.php?+)"},
    {"MJ12bot 1.2.4", "Mozilla/5.0 (compatible; MJ12bot/v1.2.4; http://www.majestic12.co.uk/bot.php?+)"},
    {"MojeekBot 0.2", "MojeekBot/0.2 (archi; http://www.mojeek.com/bot.html)"},
    {"MojeekBot 2.0", "Mozilla/5.0 (compatible; MojeekBot/2.0; http://www.mojeek.com/bot.html)"},
    {"Moreoverbot 5.0", "Moreoverbot/5.00 (+http://www.moreover.com; webmaster@moreover.com)"},
    {"Moreoverbot 5.0", "Moreoverbot/5.00 (+http://www.moreover.com)"},
    {"Moreoverbot 5.1", "Moreoverbot/5.1 ( http://w.moreover.com; webmaster@moreover.com) Mozilla/5.0"},
    {"Morning Paper 1.0", "Morning Paper 1.0 (robots.txt compliant!)"},
    {"msnbot 0.1", "MSNBOT/0.1 (http://search.msn.com/msnbot.htm)"},
    {"msnbot 0.11", "msnbot/0.11 ( http://search.msn.com/msnbot.htm)"},
    {"msnbot 0.9", "msnbot/0.9 (+http://search.msn.com/msnbot.htm)"},
    {"msnbot 1.0", "msnbot/1.0 (+http://search.msn.com/msnbot.htm)"},
    {"msnbot 1.1", "msnbot/1.1 (+http://search.msn.com/msnbot.htm)"},
    {"msnbot 1.1", "msnbot/1.1"},
    {"msnbot 2.0b", "msnbot/2.0b"},
    {"msnbot 2.1", "msnbot/2.1"},
    {"MSRBot", "MSRBOT (http://research.microsoft.com/research/sv/msrbot/)"},
    {"MSRBot", "MSRBOT"},
    {"mxbot 1.0", "Mozilla/5.0 (compatible; mxbot/1.0; +http://www.chainn.com/mxbot.html)"},
    {"mxbot 1.0", "Mozilla/5.0 (compatible; mxbot/1.0; http://www.chainn.com/mxbot.html)"},
    {"NetResearchServer 2.5", "NetResearchServer/2.5(loopimprovements.com/robot.html)"},
    {"NetResearchServer 2.7", "NetResearchServer/2.7(loopimprovements.com/robot.html)"},
    {"NetResearchServer 2.8", "NetResearchServer/2.8(loopimprovements.com/robot.html)"},
    {"NetResearchServer 3.5", "NetResearchServer/3.5(loopimprovements.com/robot.html)"},
    {"NetResearchServer 4.0", "NetResearchServer/4.0(loopimprovements.com/robot.html)"},
    {"NetSeer Crawler 2.0", "Mozilla/5.0 (compatible; NetSeer crawler/2.0; +http://www.netseer.com/crawler.html; crawler@netseer.com)"},
    {"NewGator 2.0", "NewsGator/2.0 Bot (http://www.newsgator.com)"},
    {"NewsGator 2.5", "NewsGator/2.5 (http://www.newsgator.com; Microsoft Windows NT 5.1.2600.0; .NET CLR 1.1.4322.2032)"},
    {"NG-Search 0.86", "NG-Search/0.86 (+http://www.ng-search.com)"},
    {"NG-Search 0.86", "NG-Search/0.86 ( http://www.ng-search.com)"},
    {"NG-Search 0.9.8", "NG-Search/0.9.8 (http://www.ng-search.com)"},
    {"nicebot", "nicebot"},
    {"noxtrumbot 1.0", "noxtrumbot/1.0 (crawler@noxtrum.com)"},
    {"Nusearch Spider", "Nusearch Spider (www.nusearch.com)"},
    {"Nusearch Spider", "nuSearch Spider (compatible; MSIE 4.01; Windows NT)"},
    {"NutchCVS 0.05", "NutchCVS/0.05 (Nutch; http://www.nutch.org/docs/en/bot.html; nutch-agent@lists.sourceforge.net)"},
    {"NutchCVS 0.06-dev", "NutchCVS/0.06-dev (Nutch; http://www.nutch.org/docs/en/bot.html; nutch-agent@lists.sourceforge.net)"},
    {"NutchCVS 0.06-dev", "NutchCVS/0.06-dev (Nutch; http://www.nutch.org/docs/en/bot.html; jagdeepssandhu@hotmail.com)"},
    {"NutchCVS 0.7", "NutchCVS/0.7 (Nutch; http://lucene.apache.org/nutch/bot.html; nutch-agent@lucene.apache.org)"},
    {"NutchCVS 0.7.1", "NutchCVS/0.7.1 (Nutch; http://lucene.apache.org/nutch/bot.html; nutch-agent@lucene.apache.org)"},
    {"NutchCVS 0.7.1", "NutchCVS/0.7.1 (Nutch running at UW; http://crawlers.cs.washington.edu/; sycrawl@cs.washington.edu)"},
    {"NutchCVS 0.7.2", "NutchCVS/0.7.2 (Nutch; http://lucene.apache.org/nutch/bot.html; nutch-agent@lucene.apache.org)"},
    {"NutchCVS 0.8-dev", "NutchCVS/0.8-dev (Nutch; http://lucene.apache.org/nutch/bot.html; nutch-agent@lucene.apache.org)"},
    {"obot", "Mozilla/4.0 (compatible; MSIE 5.5; Windows NT 4.0; obot)"},
    {"omgilibot 0.3", "omgilibot/0.3 +http://www.omgili.com/Crawler.html"},
    {"omgilibot 0.3", "omgilibot/0.3 http://www.omgili.com/Crawler.html"},
    {"OmniExplorer_Bot 4.32", "OmniExplorer_Bot/4.32 (+http://www.omni-explorer.com) WorldIndexer"},
    {"OmniExplorer_Bot 4.80", "OmniExplorer_Bot/4.80 (+http://www.omni-explorer.com) WorldIndexer"},
    {"OmniExplorer_Bot 5.01", "OmniExplorer_Bot/5.01 (+http://www.omni-explorer.com) WorldIndexer"},
    {"OmniExplorer_Bot 5.20", "OmniExplorer_Bot/5.20 (+http://www.omni-explorer.com) WorldIndexer"},
    {"OmniExplorer_Bot 5.25", "OmniExplorer_Bot/5.25 (+http://www.omni-explorer.com) WorldIndexer"},
    {"OmniExplorer_Bot 5.28", "OmniExplorer_Bot/5.28 (+http://www.omni-explorer.com) WorldIndexer"},
    {"OmniExplorer_Bot 5.91c", "OmniExplorer_Bot/5.91c (+http://www.omni-explorer.com) WorldIndexer"},
    {"OmniExplorer_Bot 6.47", "OmniExplorer_Bot/6.47 (+http://www.omni-explorer.com) WorldIndexer"},
    {"OmniExplorer_Bot 6.60", "OmniExplorer_Bot/6.60 (+http://www.omni-explorer.com) WorldIndexer"},
    {"OmniExplorer_Bot 6.62", "OmniExplorer_Bot/6.62 (+http://www.omni-explorer.com) WorldIndexer"},
    {"OmniExplorer_Bot 6.63b", "OmniExplorer_Bot/6.63b (+http://www.omni-explorer.com) WorldIndexer"},
    {"OmniExplorer_Bot 6.65a", "OmniExplorer_Bot/6.65a (+http://www.omni-explorer.com) WorldIndexer"},
    {"OmniExplorer_Bot 6.70", "OmniExplorer_Bot/6.70 (+http://www.omni-explorer.com) WorldIndexer"},
    {"OOZBOT 0.17", "OOZBOT/0.17 (--; http://www.setooz.com/oozbot.html; pvvpr at iiit dot ac dot in)"},
    {"OOZBOT 0.20", "OOZBOT/0.20 ( -- ; http://www.setooz.com/oozbot.html ; agentname at setooz dot_com )"},
    {"Orbiter", "Orbiter (+http://www.dailyorbit.com/bot.htm)"},
    {"PageBitesHyperBot 600", "PageBitesHyperBot/600 (http://www.pagebites.com/)"},
    {"Peew 1.0", "Mozilla/5.0 (compatible; Peew/1.0; http://www.peew.de/crawler/)"},
    {"polybot 1.0", "polybot 1.0 (http://cis.poly.edu/polybot/)"},
    {"PostPost 1.0", "PostPost/1.0 (+http://postpo.st/crawlers)"},
    {"psbot 0.1", "psbot/0.1 (+http://www.picsearch.com/bot.html)"},
    {"Radian6", "radian6_default_(www.radian6.com/crawler)"},
    {"RAMPyBot 0.1", "RAMPyBot - www.giveRAMP.com/0.1 (RAMPyBot - www.giveRAMP.com; http://www.giveramp.com/bot.html; support@giveRAMP.com)"},
    {"RufusBot", "RufusBot (Rufus Web Miner; http://64.124.122.252/feedback.html)"},
    {"SandCrawler", "SandCrawler - Compatibility Testing"},
    {"Seekbot 1.0", "Seekbot/1.0 (http://www.seekbot.net/bot.html) RobotsTxtFetcher/1.2"},
    {"Seekbot 1.0", "Seekbot/1.0 (http://www.seekbot.net/bot.html) HTTPFetcher/2.1"},
    {"Seekbot 1.0", "Seekbot/1.0 (http://www.seekbot.net/bot.html) HTTPFetcher/0.3"},
    {"Seekbot 1.0", "Seekbot/1.0 (http://www.seekbot.net/bot.html)"},
    {"Sensis Web Crawler", "Sensis Web Crawler (search_comments\\at\\sensis\\dot\\com\\dot\\au)"},
    {"SEOChat::Bot 1.1", "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.0) SEOChat::Bot v1.1"},
    {"SeznamBot 2.0", "SeznamBot/2.0 (+http://fulltext.seznam.cz/)"},
    {"SeznamBot 2.0", "SeznamBot/2.0 (+http://fulltext.sblog.cz/robot/)"},
    {"Shim-Crawler", "Shim-Crawler(Mozilla-compatible; http://www.logos.ic.i.u-tokyo.ac.jp/crawler/; crawl@logos.ic.i.u-tokyo.ac.jp)"},
    {"Shim-Crawler", "Shim-Crawler"},
    {"ShopWiki 1.0", "ShopWiki/1.0 ( +http://www.shopwiki.com/wiki/Help:Bot)"},
    {"Shoula robot", "Mozilla/4.0 (compatible: Shoula robot)"},
    {"SiteBot 0.1", "Mozilla/5.0 (compatible; SiteBot/0.1; +http://www.sitebot.org/robot/)"},
    {"SiteBot 0.1", "Mozilla/5.0 (compatible; SiteBot/0.1; http://www.sitebot.org/robot/)"},
    {"Snappy 1.1", "Snappy/1.1 ( http://www.urltrends.com/ )"},
    {"sogou spider", "sogou spider"},
    {"Sosospider", "Sosospider+(+http://help.soso.com/webspider.htm)"},
    {"Speedy Spider", "Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US) Speedy Spider"},
    {"Speedy Spider", "Speedy Spider (http://www.entireweb.com/about/search_tech/speedy_spider/)"},
    {"Speedy Spider", "Speedy Spider (http://www.entireweb.com/about/search_tech/speedyspider/)"},
    {"Speedy Spider", "Speedy Spider (http://www.entireweb.com)"},
    {"Speedy Spider 1.0", "Speedy Spider (Entireweb; Beta/1.0; http://www.entireweb.com/about/search_tech/speedyspider/)"},
    {"Speedy Spider 1.0", "Speedy Spider (Beta/1.0; www.entireweb.com)"},
    {"Speedy Spider 1.1", "Speedy Spider (Entireweb; Beta/1.1; http://www.entireweb.com/about/search_tech/speedyspider/)"},
    {"Speedy Spider 1.2", "Speedy Spider (Entireweb; Beta/1.2; http://www.entireweb.com/about/search_tech/speedyspider/)"},
    {"Speedy Spider 1.3", "Speedy Spider (Entireweb; Beta/1.3; http://www.entireweb.com/about/search_tech/speedyspider/)"},
    {"Speedy Spider 5.0", "Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US) Speedy Spider (http://www.entireweb.com/about/search_tech/speedy_spider/)"},
    {"Speedy Spider 5.0", "Mozilla/5.0 (compatible; Speedy Spider; http://www.entireweb.com/about/search_tech/speedy_spider/)"},
    {"Suggybot 0.01a", "Mozilla/5.0 (compatible; suggybot v0.01a, http://blog.suggy.com/was-ist-suggy/suggy-webcrawler/)"},
    {"SurveyBot 2.3", "SurveyBot/2.3+(Whois+Source)"},
    {"SurveyBot 2.3", "SurveyBot/2.3 (Whois Source)"},
    {"SynooBot 0.7.1", "SynooBot/0.7.1 (SynooBot; http://www.synoo.de/bot.html; webmaster@synoo.com)"},
    {"Teoma", "Mozilla/2.0 (compatible; Ask Jeeves/Teoma; +http://sp.ask.com/docs/about/tech_crawling.html)"},
    {"Teoma", "Mozilla/2.0 (compatible; Ask Jeeves/Teoma; +http://about.ask.com/en/docs/about/webmasters.shtml)"},
    {"Teoma", "Mozilla/2.0 (compatible; Ask Jeeves/Teoma)"},
    {"TerrawizBot 1.0", "TerrawizBot/1.0 (+http://www.terrawiz.com/bot.html)"},
    {"TheSuBot 0.1", "TheSuBot/0.1 (www.thesubot.de)"},
    {"TheSuBot 0.2", "TheSuBot/0.2 (www.thesubot.de)"},
    {"Thumbnail.CZ 1.1", "Thumbnail.CZ robot 1.1 (http://thumbnail.cz/why-no-robots-txt.html)"},
    {"TinEye", "TinEye"},
    {"TinEye 1.1", "TinEye/1.1 (http://tineye.com/crawler.html)"},
    {"TurnitinBot 1.5", "TurnitinBot/1.5 http://www.turnitin.com/robot/crawlerinfo.html"},
    {"TurnitinBot 1.5", "TurnitinBot/1.5 (http://www.turnitin.com/robot/crawlerinfo.html)"},
    {"TurnitinBot 1.5", "TurnitinBot/1.5 http://www.turnitin.com/robot/crawlerinfo.html"},
    {"TurnitinBot 1.5", "TurnitinBot/1.5 (http://www.turnitin.com/robot/crawlerinfo.html)"},
    {"TurnitinBot 2.0", "TurnitinBot/2.0 http://www.turnitin.com/robot/crawlerinfo.html"},
    {"TurnitinBot 2.1", "TurnitinBot/2.1 (http://www.turnitin.com/robot/crawlerinfo.html)"},
    {"TweetedTimes Bot 1.0", "Mozilla/5.0 (compatible; TweetedTimes Bot/1.0; http://tweetedtimes.com)"},
    {"TwengaBot", "TwengaBot"},
    {"Urlfilebot 2.2", "Mozilla/5.0 (compatible; Urlfilebot/2.2; +http://urlfile.com/bot.html)"},
    {"Vagabondo 2.0 MT", "Mozilla/3.0 (Vagabondo/2.0 MT; webcrawler@NOSPAMexperimental.net; http://aanmelden.ilse.nl/?aanmeld_mode=webhints)"},
    {"Vagabondo 2.1", "Mozilla/5.0 (compatible; Vagabondo/2.1; webcrawler at wise-guys dot nl; http://webagent.wise-guys.nl/)"},
    {"Vagabondo 2.2", "Mozilla/4.0 (compatible; Vagabondo/2.2; webcrawler at wise-guys dot nl; http://webagent.wise-guys.nl/)"},
    {"Vagabondo 4.0Beta", "Mozilla/4.0 (compatible; Vagabondo/4.0Beta; webcrawler at wise-guys dot nl; http://webagent.wise-guys.nl/; http://www.wise-guys.nl/)"},
    {"VoilaBot 1.2", "Mozilla/4.0 (compatible; MSIE 5.0; Windows 95) VoilaBot BETA 1.2 (http://www.voila.com/)"},
    {"Vortex 1.2", "VORTEX/1.2 ( http://marty.anstey.ca/robots/vortex/)"},
    {"Vortex 2.2", "Vortex/2.2 (+http://marty.anstey.ca/robots/vortex/)"},
    {"Vortex 2.2", "Vortex/2.2 ( http://marty.anstey.ca/robots/vortex/)"},
    {"voyager 2.0", "voyager/2.0 (http://www.kosmix.com/crawler.html)"},
    {"Websquash", "Websquash.com (Add url robot)"},
    {"wf84", "http://www.almaden.ibm.com/cs/crawler [wf84]"},
    {"WoFindeIch Robot 1.0", "WoFindeIch Robot 1.0(+http://www.search.wofindeich.com/robot.php)"},
    {"WoFindeIch Robot 1.0", "WoFindeIch Robot 1.0( http://www.search.wofindeich.com/robot.php)"},
    {"WomlpeFactory 0.1", "WomlpeFactory/0.1 (+http://www.Womple.com/bot.html)"},
    {"Xaldon_WebSpider 2.0.b1", "Xaldon_WebSpider/2.0.b1"},
    {"Xaldon_WebSpider 2.0.b1", "Xaldon_WebSpider/2.0.b1"},
    {"yacy", "yacybot (x86 Windows XP 5.1; java 1.6.0_12; Europe/de) http://yacy.net/bot.html"},
    {"yacybot", "yacybot (x86 Windows XP 5.1; java 1.6.0_11; Europe/de) http://yacy.net/bot.html"},
    {"yacybot", "yacybot (x86 Windows XP 5.1; java 1.6.0; Europe/de) http://yacy.net/yacy/bot.html"},
    {"yacybot", "yacybot (x86 Windows 2000 5.0; java 1.6.0_16; Europe/de) http://yacy.net/bot.html"},
    {"yacybot", "yacybot (ppc Mac OS X 10.5.2; java 1.5.0_13; Europe/de) http://yacy.net/bot.html"},
    {"yacybot", "yacybot (ppc Mac OS X 10.4.10; java 1.5.0_07; Europe/de) http://yacy.net/bot.html"},
    {"yacybot", "yacybot (i386 Mac OS X 10.5.7; java 1.5.0_16; Europe/de) http://yacy.net/bot.html"},
    {"yacybot", "yacybot (i386 Linux 2.6.9-023stab046.2-smp; java 1.6.0_05; Europe/en) http://yacy.net/bot.html"},
    {"yacybot", "yacybot (i386 Linux 2.6.8-022stab070.5-enterprise; java 1.4.2-03; Europe/en) yacy.net"},
    {"yacybot", "yacybot (i386 Linux 2.6.31-16-generic; java 1.6.0_15; Europe/en) http://yacy.net/bot.html"},
    {"yacybot", "yacybot (i386 Linux 2.6.26-2-686; java 1.6.0_0; Europe/en) http://yacy.net/bot.html"},
    {"yacybot", "yacybot (i386 Linux 2.6.24-28-generic; java 1.6.0_20; Europe/en) http://yacy.net/bot.html"},
    {"yacybot", "yacybot (i386 Linux 2.6.24-24-generic; java 1.6.0_07; Europe/en) http://yacy.net/bot.html"},
    {"yacybot", "yacybot (i386 Linux 2.6.24-23-generic; java 1.6.0_16; Europe/en) http://yacy.net/bot.html"},
    {"yacybot", "yacybot (i386 Linux 2.6.23; java 1.6.0_17; Europe/en) http://yacy.net/bot.html"},
    {"yacybot", "yacybot (i386 Linux 2.6.23; java 1.6.0_04; Europe/en) http://yacy.net/bot.html"},
    {"yacybot", "yacybot (i386 Linux 2.6.22-14-generic; java 1.6.0_03; Europe/de) http://yacy.net/bot.html"},
    {"yacybot", "yacybot (amd64 Windows 7 6.1; java 1.6.0_17; Europe/de) http://yacy.net/bot.html"},
    {"yacybot", "yacybot (amd64 Linux 2.6.28-18-generic; java 1.6.0_0; Europe/en) http://yacy.net/bot.html"},
    {"yacybot", "yacybot (amd64 Linux 2.6.16-2-amd64-k8-smp; java 1.5.0_10; Europe/en) http://yacy.net/yacy/bot.html"},
    {"Yahoo! Slurp", "Mozilla/5.0 (compatible; Yahoo! Slurp; http://help.yahoo.com/help/us/ysearch/slurp)"},
    {"Yahoo! Slurp China", "Mozilla/5.0 (compatible; Yahoo! Slurp China; http://misc.yahoo.com.cn/help.html)"},
    {"YahooSeeker 1.2", "YahooSeeker/1.2 (compatible; Mozilla 4.0; MSIE 5.5; yahooseeker at yahoo-inc dot com ; http://help.yahoo.com/help/us/shop/merchant/)"},
    {"YahooSeeker-Testing 3.9", "YahooSeeker-Testing/v3.9 (compatible; Mozilla 4.0; MSIE 5.5; http://search.yahoo.com/)"},
    {"YandexBot 3.0", "Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)"},
    {"Yasaklibot 1.2", "Yasaklibot/v1.2 (http://www.Yasakli.com/bot.php)"},
    {"Yeti 1.0", "Yeti/1.0 (NHN Corp.; http://help.naver.com/robots/)"},
    {"Yeti 1.0", "Yeti/1.0 (+http://help.naver.com/robots/)"},
    {"YodaoBot 1.0", "Mozilla/5.0 (compatible; YodaoBot/1.0; http://www.yodao.com/help/webmaster/spider/; )"},
    {"YoudaoBot 1.0", "Mozilla/5.0 (compatible; YoudaoBot/1.0; http://www.youdao.com/help/webmaster/spider/; )"},
    {"Zealbot 1.0", "Mozilla/4.0 (compatible; Zealbot 1.0)"},
    {"zspider 0.9-dev", "zspider/0.9-dev http://feedback.redkolibri.com/"},
    {"ZyBorg 1.0", "Mozilla/4.0 compatible ZyBorg/1.0 DLC (wn.zyborg@looksmart.net; http://www.WISEnutbot.com)"},
    {"ZyBorg 1.0", "Mozilla/4.0 compatible ZyBorg/1.0 Dead Link Checker (wn.zyborg@looksmart.net; http://www.WISEnutbot.com)"},
    {"ZyBorg 1.0", "Mozilla/4.0 compatible ZyBorg/1.0 Dead Link Checker (wn.dlc@looksmart.net; http://www.WISEnutbot.com)"},
    {"ZyBorg 1.0", "Mozilla/4.0 compatible ZyBorg/1.0 (wn.zyborg@looksmart.net; http://www.WISEnutbot.com)"},
    {"ZyBorg 1.0", "Mozilla/4.0 compatible ZyBorg/1.0 (wn-16.zyborg@looksmart.net; http://www.WISEnutbot.com)"},
    {"ZyBorg 1.0", "Mozilla/4.0 compatible ZyBorg/1.0 (wn-14.zyborg@looksmart.net; http://www.WISEnutbot.com)"},
    {"Facebook 1.1", "facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)"},
    {"LinkedInBot/1.0", "LinkedInBot/1.0 (compatible; Mozilla/5.0; Jakarta Commons-HttpClient/3.1 +http://www.linkedin.com)"},
    {"msnbot-media", "msnbot-media/1.1 (+http://search.msn.com/msnbot.htm)"},
    {"QuerySeekerSpider", "QuerySeekerSpider ( http://queryseeker.com/bot.html )"},
    {"Google HTTP Client library", "Google-HTTP-Java-Client/1.17.0-rc (gzip)"},
    {"InAGist URL Resolver", "InAGist URL Resolver (http://inagist.com)"},
    {"Jakarta Commons-HttpClient", "Jakarta Commons-HttpClient/3.0.1"},
    {"Java Client", "Java/1.7.0_75"},
    {"Kimengi nineconnections.com", "Kimengi/nineconnections.com"},
    {"MetaURI", "MetaURI API/2.0 +metauri.com"},
    {"ShowyouBot", "ShowyouBot (http://showyou.com/crawler)"},
    {"Python", "python-requests/2.5.1 CPython/2.7.9 Linux/3.10.23-xxxx-std-ipv6-64"},
    {"Moz.com", "rogerbot/1.0 (http://moz.com/help/pro/what-is-rogerbot-, rogerbot-crawler+shiny@moz.com)"},
    {"OpenHoseBot", "Mozilla/5.0 (compatible; OpenHoseBot/2.1; http://www.openhose.org/bot.html)"},
    {"PaperLiBot", "Mozilla/5.0 (compatible; PaperLiBot/2.1; http://support.paper.li/entries/20023257-what-is-paper-li)"},
    {"uMBot", "Mozilla/5.0 (compatible; uMBot-LN/1.0; mailto: crawling@ubermetrics-technologies.com)"},
    {"Yahoo! Slurp", "Mozilla/5.0 (compatible; Yahoo! Slurp; http://help.yahoo.com/help/us/ysearch/slurp)"},
    {"Kraken", "Mozilla/5.0 (compatible; Kraken/0.1; http://linkfluence.net/; bot@linkfluence.net)"},
    {"EveryoneSocialBot", "Mozilla/5.0 (compatible; EveryoneSocialBot/1.0; support@everyonesocial.com http://everyonesocial.com/)"},
    {"Simple Reach", "simplereach/1.1 ( http://simplereach.com/docs/agent)"},
    {"HTMLParser", "HTMLParser/2.0"},
    {"FlipboardProxy", "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:28.0) Gecko/20100101 Firefox/28.0 (FlipboardProxy/1.1;  http://flipboard.com/browserproxy)"},
    {"Go package", "Go 1.1 package"},
    {"Apple Bot", "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/600.2.5 (KHTML, like Gecko) Version/8.0.2 Safari/600.2.5 (Applebot/0.1;  http://www.apple.com/go/applebot)"},
    {"Jack", "jack"},
    {"Obscure Mozilla one", "Mozilla/5.0 ()"},
    {"Facebot Full site crawler", "Facebot"},
    {"Bot device type check with is method", "Facebot"},
    {"AWS ELB Bot", "ELB-HealthChecker/1.0"},
    {"AWS Ops Works monitoring Bot", "monit/5.6"},
    {"Googlebot (Google Web search)", "Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)"},
    {"Googlebot rarely used (Google Web search)", "Googlebot/2.1 (+http://www.google.com/bot.html)"},
    {"Googlebot Images", "Googlebot-Image/1.0"},
    {"Googlebot Video", "Googlebot-Video/1.0"},
    {"Google AdSense", "Mediapartners-Google"},
    {"Google AdsBot landing page quality check", "AdsBot-Google (+http://www.google.com/adsbot.html)"},
    {"Wget user-agent", "Wget/1.9.1"},
    {"jora.com JobBot", "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) JobBot/5.0 (compatible; +http://www.jobseeker.com.au/bot.html) Safari/538.1"},
    {"GoogleCloud Monitor", "GoogleCloudMonitoring-UptimeChecks(https://cloud.google.com/monitoring)"}
  ]

  test "bots" do
    @data
    |> Enum.each(fn({device, ua}) ->
      detected = Parser.parse(ua)
      assert(detected == @device, "#{device} detected as #{detected} for #{ua}")
    end)
  end
end
