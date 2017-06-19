
<!-- rnb-text-begin -->

---
title: "Two-Host with Sinusoidal Forcing of Birth"
authors: DN, TW, LW 
output: html_notebook
---
#Questions to Explore for Monday 19.06.2017




<!-- rnb-text-end -->


<!-- rnb-chunk-begin -->


<!-- rnb-source-begin eyJkYXRhIjpbIiNjYWxsIHJlcXVpcmVkIHBhY2thZ2VzIiwiI25vdGU6IHdvbid0IG5lc3Npc2FyaWx5IG5lZWQvdXNlIEVwaUR5bmFtaWNzIiwiI0VwaUR5bmFtaWNzOiBodHRwczovL3JkcnIuaW8vZ2l0aHViL29zd2FsZG9zYW50b3MvRXBpRHluYW1pY3MvIiwibGlicmFyeShFcGlNb2RlbCkiXX0= -->

```r
#call required packages
#note: won't nessisarily need/use EpiDynamics
#EpiDynamics: https://rdrr.io/github/oswaldosantos/EpiDynamics/
library(EpiModel)
```



<!-- rnb-source-end -->

<!-- rnb-warning-begin eyJkYXRhIjoiV2FybmluZzogcGFja2FnZSAnRXBpTW9kZWwnIHdhcyBidWlsdCB1bmRlciBSIHZlcnNpb24gMy4zLjNcbiJ9 -->

```
Warning: package 'EpiModel' was built under R version 3.3.3
```



<!-- rnb-warning-end -->

<!-- rnb-message-begin eyJkYXRhIjoiTG9hZGluZyByZXF1aXJlZCBwYWNrYWdlOiBkZVNvbHZlXG4ifQ== -->

```
Loading required package: deSolve
```



<!-- rnb-message-end -->

<!-- rnb-warning-begin eyJkYXRhIjoiV2FybmluZzogcGFja2FnZSAnZGVTb2x2ZScgd2FzIGJ1aWx0IHVuZGVyIFIgdmVyc2lvbiAzLjMuM1xuIn0= -->

```
Warning: package 'deSolve' was built under R version 3.3.3
```



<!-- rnb-warning-end -->

<!-- rnb-message-begin eyJkYXRhIjoiTG9hZGluZyByZXF1aXJlZCBwYWNrYWdlOiBuZXR3b3JrRHluYW1pY1xuIn0= -->

```
Loading required package: networkDynamic
```



<!-- rnb-message-end -->

<!-- rnb-warning-begin eyJkYXRhIjoiV2FybmluZzogcGFja2FnZSAnbmV0d29ya0R5bmFtaWMnIHdhcyBidWlsdCB1bmRlciBSIHZlcnNpb24gMy4zLjNcbiJ9 -->

```
Warning: package 'networkDynamic' was built under R version 3.3.3
```



<!-- rnb-warning-end -->

<!-- rnb-message-begin eyJkYXRhIjoiTG9hZGluZyByZXF1aXJlZCBwYWNrYWdlOiBuZXR3b3JrXG4ifQ== -->

```
Loading required package: network
```



<!-- rnb-message-end -->

<!-- rnb-warning-begin eyJkYXRhIjoiV2FybmluZzogcGFja2FnZSAnbmV0d29yaycgd2FzIGJ1aWx0IHVuZGVyIFIgdmVyc2lvbiAzLjMuM1xuIn0= -->

```
Warning: package 'network' was built under R version 3.3.3
```



<!-- rnb-warning-end -->

<!-- rnb-message-begin eyJkYXRhIjoibmV0d29yazogQ2xhc3NlcyBmb3IgUmVsYXRpb25hbCBEYXRhXG5WZXJzaW9uIDEuMTMuMCBjcmVhdGVkIG9uIDIwMTUtMDgtMzEuXG5jb3B5cmlnaHQgKGMpIDIwMDUsIENhcnRlciBULiBCdXR0cywgVW5pdmVyc2l0eSBvZiBDYWxpZm9ybmlhLUlydmluZVxuICAgICAgICAgICAgICAgICAgICBNYXJrIFMuIEhhbmRjb2NrLCBVbml2ZXJzaXR5IG9mIENhbGlmb3JuaWEgLS0gTG9zIEFuZ2VsZXNcbiAgICAgICAgICAgICAgICAgICAgRGF2aWQgUi4gSHVudGVyLCBQZW5uIFN0YXRlIFVuaXZlcnNpdHlcbiAgICAgICAgICAgICAgICAgICAgTWFydGluYSBNb3JyaXMsIFVuaXZlcnNpdHkgb2YgV2FzaGluZ3RvblxuICAgICAgICAgICAgICAgICAgICBTa3llIEJlbmRlci1kZU1vbGwsIFVuaXZlcnNpdHkgb2YgV2FzaGluZ3RvblxuIEZvciBjaXRhdGlvbiBpbmZvcm1hdGlvbiwgdHlwZSBjaXRhdGlvbihcIm5ldHdvcmtcIikuXG4gVHlwZSBoZWxwKFwibmV0d29yay1wYWNrYWdlXCIpIHRvIGdldCBzdGFydGVkLlxuIn0= -->

```
network: Classes for Relational Data
Version 1.13.0 created on 2015-08-31.
copyright (c) 2005, Carter T. Butts, University of California-Irvine
                    Mark S. Handcock, University of California -- Los Angeles
                    David R. Hunter, Penn State University
                    Martina Morris, University of Washington
                    Skye Bender-deMoll, University of Washington
 For citation information, type citation("network").
 Type help("network-package") to get started.
```



<!-- rnb-message-end -->

<!-- rnb-message-begin eyJkYXRhIjoiXG5uZXR3b3JrRHluYW1pYzogdmVyc2lvbiAwLjkuMCwgY3JlYXRlZCBvbiAyMDE2LTAxLTEyXG5Db3B5cmlnaHQgKGMpIDIwMTYsIENhcnRlciBULiBCdXR0cywgVW5pdmVyc2l0eSBvZiBDYWxpZm9ybmlhIC0tIElydmluZVxuICAgICAgICAgICAgICAgICAgICBBeW4gTGVzbGllLUNvb2ssIFVuaXZlcnNpdHkgb2YgV2FzaGluZ3RvblxuICAgICAgICAgICAgICAgICAgICBQYXZlbCBOLiBLcml2aXRza3ksIFVuaXZlcnNpdHkgb2YgV29sbG9uZ29uZ1xuICAgICAgICAgICAgICAgICAgICBTa3llIEJlbmRlci1kZU1vbGwsIFVuaXZlcnNpdHkgb2YgV2FzaGluZ3RvblxuICAgICAgICAgICAgICAgICAgICB3aXRoIGNvbnRyaWJ1dGlvbnMgZnJvbVxuICAgICAgICAgICAgICAgICAgICBaYWNrIEFsbXF1aXN0LCBVbml2ZXJzaXR5IG9mIENhbGlmb3JuaWEgLS0gSXJ2aW5lXG4gICAgICAgICAgICAgICAgICAgIERhdmlkIFIuIEh1bnRlciwgUGVubiBTdGF0ZSBVbml2ZXJzaXR5XG4gICAgICAgICAgICAgICAgICAgIExpIFdhbmdcbiAgICAgICAgICAgICAgICAgICAgS2lyayBMaSwgVW5pdmVyc2l0eSBvZiBXYXNoaW5ndG9uXG4gICAgICAgICAgICAgICAgICAgIFN0ZXZlbiBNLiBHb29kcmVhdSwgVW5pdmVyc2l0eSBvZiBXYXNoaW5ndG9uXG4gICAgICAgICAgICAgICAgICAgIEplZmZyZXkgSG9ybmVyXG4gICAgICAgICAgICAgICAgICAgIE1hcnRpbmEgTW9ycmlzLCBVbml2ZXJzaXR5IG9mIFdhc2hpbmd0b25cbkJhc2VkIG9uIFwic3RhdG5ldFwiIHByb2plY3Qgc29mdHdhcmUgKHN0YXRuZXQub3JnKS5cbkZvciBsaWNlbnNlIGFuZCBjaXRhdGlvbiBpbmZvcm1hdGlvbiBzZWUgc3RhdG5ldC5vcmcvYXR0cmlidXRpb25cbm9yIHR5cGUgY2l0YXRpb24oXCJuZXR3b3JrRHluYW1pY1wiKS5cbiJ9 -->

```

networkDynamic: version 0.9.0, created on 2016-01-12
Copyright (c) 2016, Carter T. Butts, University of California -- Irvine
                    Ayn Leslie-Cook, University of Washington
                    Pavel N. Krivitsky, University of Wollongong
                    Skye Bender-deMoll, University of Washington
                    with contributions from
                    Zack Almquist, University of California -- Irvine
                    David R. Hunter, Penn State University
                    Li Wang
                    Kirk Li, University of Washington
                    Steven M. Goodreau, University of Washington
                    Jeffrey Horner
                    Martina Morris, University of Washington
Based on "statnet" project software (statnet.org).
For license and citation information see statnet.org/attribution
or type citation("networkDynamic").
```



<!-- rnb-message-end -->

<!-- rnb-message-begin eyJkYXRhIjoiTG9hZGluZyByZXF1aXJlZCBwYWNrYWdlOiB0ZXJnbVxuIn0= -->

```
Loading required package: tergm
```



<!-- rnb-message-end -->

<!-- rnb-warning-begin eyJkYXRhIjoiV2FybmluZzogcGFja2FnZSAndGVyZ20nIHdhcyBidWlsdCB1bmRlciBSIHZlcnNpb24gMy4zLjNcbiJ9 -->

```
Warning: package 'tergm' was built under R version 3.3.3
```



<!-- rnb-warning-end -->

<!-- rnb-message-begin eyJkYXRhIjoiTG9hZGluZyByZXF1aXJlZCBwYWNrYWdlOiBzdGF0bmV0LmNvbW1vblxuIn0= -->

```
Loading required package: statnet.common
```



<!-- rnb-message-end -->

<!-- rnb-warning-begin eyJkYXRhIjoiV2FybmluZzogcGFja2FnZSAnc3RhdG5ldC5jb21tb24nIHdhcyBidWlsdCB1bmRlciBSIHZlcnNpb24gMy4zLjJcbiJ9 -->

```
Warning: package 'statnet.common' was built under R version 3.3.2
```



<!-- rnb-warning-end -->

<!-- rnb-message-begin eyJkYXRhIjoiTG9hZGluZyByZXF1aXJlZCBwYWNrYWdlOiBlcmdtXG4ifQ== -->

```
Loading required package: ergm
```



<!-- rnb-message-end -->

<!-- rnb-warning-begin eyJkYXRhIjoiV2FybmluZzogcGFja2FnZSAnZXJnbScgd2FzIGJ1aWx0IHVuZGVyIFIgdmVyc2lvbiAzLjMuM1xuIn0= -->

```
Warning: package 'ergm' was built under R version 3.3.3
```



<!-- rnb-warning-end -->

<!-- rnb-message-begin eyJkYXRhIjoiXG5lcmdtOiB2ZXJzaW9uIDMuNy4xLCBjcmVhdGVkIG9uIDIwMTctMDMtMjBcbkNvcHlyaWdodCAoYykgMjAxNywgTWFyayBTLiBIYW5kY29jaywgVW5pdmVyc2l0eSBvZiBDYWxpZm9ybmlhIC0tIExvcyBBbmdlbGVzXG4gICAgICAgICAgICAgICAgICAgIERhdmlkIFIuIEh1bnRlciwgUGVubiBTdGF0ZSBVbml2ZXJzaXR5XG4gICAgICAgICAgICAgICAgICAgIENhcnRlciBULiBCdXR0cywgVW5pdmVyc2l0eSBvZiBDYWxpZm9ybmlhIC0tIElydmluZVxuICAgICAgICAgICAgICAgICAgICBTdGV2ZW4gTS4gR29vZHJlYXUsIFVuaXZlcnNpdHkgb2YgV2FzaGluZ3RvblxuICAgICAgICAgICAgICAgICAgICBQYXZlbCBOLiBLcml2aXRza3ksIFVuaXZlcnNpdHkgb2YgV29sbG9uZ29uZ1xuICAgICAgICAgICAgICAgICAgICBNYXJ0aW5hIE1vcnJpcywgVW5pdmVyc2l0eSBvZiBXYXNoaW5ndG9uXG4gICAgICAgICAgICAgICAgICAgIHdpdGggY29udHJpYnV0aW9ucyBmcm9tXG4gICAgICAgICAgICAgICAgICAgIExpIFdhbmdcbiAgICAgICAgICAgICAgICAgICAgS2lyayBMaSwgVW5pdmVyc2l0eSBvZiBXYXNoaW5ndG9uXG4gICAgICAgICAgICAgICAgICAgIFNreWUgQmVuZGVyLWRlTW9sbCwgVW5pdmVyc2l0eSBvZiBXYXNoaW5ndG9uXG5CYXNlZCBvbiBcInN0YXRuZXRcIiBwcm9qZWN0IHNvZnR3YXJlIChzdGF0bmV0Lm9yZykuXG5Gb3IgbGljZW5zZSBhbmQgY2l0YXRpb24gaW5mb3JtYXRpb24gc2VlIHN0YXRuZXQub3JnL2F0dHJpYnV0aW9uXG5vciB0eXBlIGNpdGF0aW9uKFwiZXJnbVwiKS5cbiJ9 -->

```

ergm: version 3.7.1, created on 2017-03-20
Copyright (c) 2017, Mark S. Handcock, University of California -- Los Angeles
                    David R. Hunter, Penn State University
                    Carter T. Butts, University of California -- Irvine
                    Steven M. Goodreau, University of Washington
                    Pavel N. Krivitsky, University of Wollongong
                    Martina Morris, University of Washington
                    with contributions from
                    Li Wang
                    Kirk Li, University of Washington
                    Skye Bender-deMoll, University of Washington
Based on "statnet" project software (statnet.org).
For license and citation information see statnet.org/attribution
or type citation("ergm").
```



<!-- rnb-message-end -->

<!-- rnb-message-begin eyJkYXRhIjoiTk9URTogVmVyc2lvbnMgYmVmb3JlIDMuNi4xIGhhZCBhIGJ1ZyBpbiB0aGUgaW1wbGVtZW50YXRpb24gb2YgdGhlXG5iZCgpIGNvbnN0cmlhbnQgd2hpY2ggZGlzdG9ydGVkIHRoZSBzYW1wbGVkIGRpc3RyaWJ1dGlvbiBzb21ld2hhdC5cbkluIGFkZGl0aW9uLCBTYW1wc29uJ3MgTW9ua3MgZGF0YXNldHMgaGFkIG1pc2xhYmVsZWQgdmVydGVjZXMuIFNlZVxudGhlIE5FV1MgYW5kIHRoZSBkb2N1bWVudGF0aW9uIGZvciBtb3JlIGRldGFpbHMuXG4ifQ== -->

```
NOTE: Versions before 3.6.1 had a bug in the implementation of the
bd() constriant which distorted the sampled distribution somewhat.
In addition, Sampson's Monks datasets had mislabeled verteces. See
the NEWS and the documentation for more details.
```



<!-- rnb-message-end -->

<!-- rnb-message-begin eyJkYXRhIjoiXG50ZXJnbTogdmVyc2lvbiAzLjQuMCwgY3JlYXRlZCBvbiAyMDE2LTAzLTI4XG5Db3B5cmlnaHQgKGMpIDIwMTYsIFBhdmVsIE4uIEtyaXZpdHNreSwgVW5pdmVyc2l0eSBvZiBXb2xsb25nb25nXG4gICAgICAgICAgICAgICAgICAgIE1hcmsgUy4gSGFuZGNvY2ssIFVuaXZlcnNpdHkgb2YgQ2FsaWZvcm5pYSAtLSBMb3MgQW5nZWxlc1xuICAgICAgICAgICAgICAgICAgICB3aXRoIGNvbnRyaWJ1dGlvbnMgZnJvbVxuICAgICAgICAgICAgICAgICAgICBEYXZpZCBSLiBIdW50ZXIsIFBlbm4gU3RhdGUgVW5pdmVyc2l0eVxuICAgICAgICAgICAgICAgICAgICBTdGV2ZW4gTS4gR29vZHJlYXUsIFVuaXZlcnNpdHkgb2YgV2FzaGluZ3RvblxuICAgICAgICAgICAgICAgICAgICBNYXJ0aW5hIE1vcnJpcywgVW5pdmVyc2l0eSBvZiBXYXNoaW5ndG9uXG4gICAgICAgICAgICAgICAgICAgIE5pY29sZSBCb2htZSBDYXJuZWdpZSwgTmV3IFlvcmsgVW5pdmVyc2l0eVxuICAgICAgICAgICAgICAgICAgICBDYXJ0ZXIgVC4gQnV0dHMsIFVuaXZlcnNpdHkgb2YgQ2FsaWZvcm5pYSAtLSBJcnZpbmVcbiAgICAgICAgICAgICAgICAgICAgQXluIExlc2xpZS1Db29rLCBVbml2ZXJzaXR5IG9mIFdhc2hpbmd0b25cbiAgICAgICAgICAgICAgICAgICAgU2t5ZSBCZW5kZXItZGVNb2xsXG4gICAgICAgICAgICAgICAgICAgIExpIFdhbmdcbiAgICAgICAgICAgICAgICAgICAgS2lyayBMaSwgVW5pdmVyc2l0eSBvZiBXYXNoaW5ndG9uXG5CYXNlZCBvbiBcInN0YXRuZXRcIiBwcm9qZWN0IHNvZnR3YXJlIChzdGF0bmV0Lm9yZykuXG5Gb3IgbGljZW5zZSBhbmQgY2l0YXRpb24gaW5mb3JtYXRpb24gc2VlIHN0YXRuZXQub3JnL2F0dHJpYnV0aW9uXG5vciB0eXBlIGNpdGF0aW9uKFwidGVyZ21cIikuXG4ifQ== -->

```

tergm: version 3.4.0, created on 2016-03-28
Copyright (c) 2016, Pavel N. Krivitsky, University of Wollongong
                    Mark S. Handcock, University of California -- Los Angeles
                    with contributions from
                    David R. Hunter, Penn State University
                    Steven M. Goodreau, University of Washington
                    Martina Morris, University of Washington
                    Nicole Bohme Carnegie, New York University
                    Carter T. Butts, University of California -- Irvine
                    Ayn Leslie-Cook, University of Washington
                    Skye Bender-deMoll
                    Li Wang
                    Kirk Li, University of Washington
Based on "statnet" project software (statnet.org).
For license and citation information see statnet.org/attribution
or type citation("tergm").
```



<!-- rnb-message-end -->

<!-- rnb-source-begin eyJkYXRhIjpbIiNsaWJyYXJ5KEVwaUR5bmFtaWNzKSIsImxpYnJhcnkodGVyZ20pIiwibGlicmFyeShkZVNvbHZlKSIsInJlcXVpcmUoa25pdHIpIl19 -->

```r
#library(EpiDynamics)
library(tergm)
library(deSolve)
require(knitr)
```



<!-- rnb-source-end -->

<!-- rnb-message-begin eyJkYXRhIjoiTG9hZGluZyByZXF1aXJlZCBwYWNrYWdlOiBrbml0clxuIn0= -->

```
Loading required package: knitr
```



<!-- rnb-message-end -->

<!-- rnb-chunk-end -->


<!-- rnb-text-begin -->


##Bifurcation Analysis Plotting
##TO DO: Figure out the storage of data/plot generated by running models--better in R?
##TO DO: Call subfuctions for different approaches to modeling seasonal forcings--figure out in R? MatLab easier


#Trail of EpiDynamics Package for Single Host

<!-- rnb-text-end -->







