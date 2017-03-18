clc;
clear;
c = yahoo;
ClosePricemmm = fetch(c,'MMM','Adj Close','05/04/99','03/16/17');
time = datetime(ClosePricemmm(:,1), 'convertfrom', 'datenum');
ClosePriceaxp = fetch(c,'AXP','Adj Close','05/04/99','03/16/17');
ClosePriceaapl = fetch(c,'AAPL','Adj Close','05/04/99','03/16/17');
ClosePriceba = fetch(c,'BA','Adj Close','05/04/99','03/16/17');
ClosePricecat = fetch(c,'CAT','Adj Close','05/04/99','03/16/17');
ClosePricecvx = fetch(c,'CVX','Adj Close','05/04/99','03/16/17');
ClosePricecsco = fetch(c,'CSCO','Adj Close','05/04/99','03/16/17');
ClosePriceko = fetch(c,'KO','Adj Close','05/04/99','03/16/17');
ClosePricedis = fetch(c,'DIS','Adj Close','05/04/99','03/16/17');
ClosePricedd = fetch(c,'DD','Adj Close','05/04/99','03/16/17');
ClosePricexom = fetch(c,'XOM','Adj Close','05/04/99','03/16/17');
ClosePricege = fetch(c,'GE','Adj Close','05/04/99','03/16/17');
ClosePricegs = fetch(c,'GS','Adj Close','05/04/99','03/16/17');
ClosePricehd = fetch(c,'HD','Adj Close','05/04/99','03/16/17');
ClosePriceibm = fetch(c,'IBM','Adj Close','05/04/99','03/16/17');
ClosePriceintc = fetch(c,'INTC','Adj Close','05/04/99','03/16/17');
ClosePricejnj = fetch(c,'JNJ','Adj Close','05/04/99','03/16/17');
ClosePricejpm = fetch(c,'JPM','Adj Close','05/04/99','03/16/17');
ClosePricemcd = fetch(c,'MCD','Adj Close','05/04/99','03/16/17');
ClosePricemrk = fetch(c,'MRK','Adj Close','05/04/99','03/16/17');
ClosePricemsft = fetch(c,'MSFT','Adj Close','05/04/99','03/16/17');
ClosePricenke = fetch(c,'NKE','Adj Close','05/04/99','03/16/17');
ClosePricepfe = fetch(c,'PFE','Adj Close','05/04/99','03/16/17');
ClosePricepg = fetch(c,'PG','Adj Close','05/04/99','03/16/17');
ClosePricetrv = fetch(c,'TRV','Adj Close','05/04/99','03/16/17');
ClosePriceutx = fetch(c,'UTX','Adj Close','05/04/99','03/16/17');
ClosePriceunh = fetch(c,'UNH','Adj Close','05/04/99','03/16/17');
ClosePricevz = fetch(c,'VZ','Adj Close','05/04/99','03/16/17');
ClosePricewmt = fetch(c,'WMT','Adj Close','05/04/99','03/16/17');
data = [flipud(ClosePricemmm(:,2)), flipud(ClosePriceaxp(:,2)), flipud(ClosePriceaapl(:,2)), flipud(ClosePriceba(:,2)), ...
flipud(ClosePricecat(:,2)), flipud(ClosePricecvx(:,2)), flipud(ClosePricecsco(:,2)), flipud(ClosePriceko(:,2)), ...
flipud(ClosePricedis(:,2)), flipud(ClosePricedd(:,2)), flipud(ClosePricexom(:,2)), flipud(ClosePricege(:,2)), ...
flipud(ClosePricegs(:,2)), flipud(ClosePricehd(:,2)), flipud(ClosePriceibm(:,2)), flipud(ClosePriceintc(:,2)), ...
flipud(ClosePricejnj(:,2)), flipud(ClosePricejpm(:,2)), flipud(ClosePricemcd(:,2)), flipud(ClosePricemrk(:,2)), ...
flipud(ClosePricemsft(:,2)), flipud(ClosePricenke(:,2)), flipud(ClosePricepfe(:,2)), flipud(ClosePricepg(:,2)), ...
flipud(ClosePricetrv(:,2)), flipud(ClosePriceutx(:,2)), flipud(ClosePriceunh(:,2)), flipud(ClosePricevz(:,2)), flipud(ClosePricewmt(:,2))];
close(c);