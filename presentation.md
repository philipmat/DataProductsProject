A Look at Smartphone Sales World-Wide
========================================================
author: Philip Mateescu
date: Sunday, March 6, 2016
font-family: 'Helvetica'
css: custom.css



Head(data,n=1) vs Tail(data,n=1)
========================================================

Companies in the market in Q1 of 2007: Microsoft, RIM, Nokia, and other.

In particular Nokia ownes with Symbian **63.52%** of the smartphone market.
Microsoft and RIM own **11.75%** and respectively **8.34%**.

Companies in the market in 2015: RIM, Apple, Microsoft, Android eco-system (Google, Samsung, HTC, etc), and others. 

The only two original OS makers, Microsoft and RIM now own **1.09%** and respectively **0.22%** of the market.

How did we get there.

2007 - Enter iOS
========================================================

Steve Jobs describes a goal to sell 10 million phones, or 1% of the mobile phones sold at the time. 
> Theres no chance that the iPhone is going to get any significant market share. No chance. -- Steve Balmer

By the end of 2008, Apple had sold **14,720,000**, representing
10.69%** of the market.

> Its kind of one more entrant into an already very busy space with lots of choice for consumers. But in terms of a sort of a sea-change for BlackBerry, I would think thats overstating it -- Jim Balsillie, RIM Co-CEO



2008-2009 - The Rise of Smartphones
========================================================
Perhaps spurred by the iPhone innovation and broad appeal, 
manufacturers across the board see an increase in sales. The market 
grows **2.16 times 
in number of units sold.

Google introduces the Android operating system, which is offered for free
to hardware makers.

> You don't need to be a computer scientist to use a Windows Phone. I think you do to use an Android phone... It is hard for me to be excited about the Android phones. - Steve Balmer

By the end of 2009 Android sells as well as Microsoft's Windows Mobile.


2010-2011 - The Years of Obliteration
=====================================

2010 Q4 sees record sales for RIM and Nokia, the latter which ships twice as many devices
as Apple and about the same as the number Android devices being sold.

With these numbers, it's hard to see
anything other than euphoria. Everybody is throwing crazy parties.
  

By the end of 2011 Nokia sees sales back to 2008 levels and now only represents **11.71%** of the market. From **63.52%** merely 4 years prior.

Microsoft abandons Windows Mobile in 2011 in favor of it's new operating system, Windows Phone,
which immediately sees double the sales, although insignificant by now.

2012 Q4, RIM with **3.53%** of market joins their bleak future.

Future Direction
================
<small>
Obviously RIM is circling the drain, while
iOS and Android continue to grow with the market.

More interesting is what happens to Windows Phone. An overall trend
shows Windows Phone growing (from 2011 inception):


```r
x = 1:nrow(data); t = 1:10
trend.wp <- lm(data$Windows.Phone ~ x + 1)$coef[2]
trend10.wp <- lm(data[27:36,]$Windows.Phone ~ t + 1)$coef[2]
```

```
[1] "Windows Phone - last 20 quarters slope: 302.078893178893"
```
However, looking at the last 10 quarters? Not so rosy:

```
[1] "Windows Phone - last 10 quarters slope: -328.866666666667"
```
I guess only time (and regression analysis) will tell.

<small>
Play with the data at https://philipmat.shinyapps.io/dataproducts-project/
</small>

</small>
