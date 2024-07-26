---
title: "Data Analysis"
author: "Tina"
editor: visual
---

::: {.cell}

```{.r .cell-code}
library(tidyverse)
```

::: {.cell-output .cell-output-stderr}

```
── Attaching core tidyverse packages ──────────────────────── tidyverse 2.0.0 ──
✔ dplyr     1.1.4     ✔ readr     2.1.5
✔ forcats   1.0.0     ✔ stringr   1.5.1
✔ ggplot2   3.5.1     ✔ tibble    3.2.1
✔ lubridate 1.9.3     ✔ tidyr     1.3.1
✔ purrr     1.0.2     
── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
✖ dplyr::filter() masks stats::filter()
✖ dplyr::lag()    masks stats::lag()
ℹ Use the conflicted package (<http://conflicted.r-lib.org/>) to force all conflicts to become errors
```


:::

```{.r .cell-code}
library(openair)
library(lubridate)
library(ggplot2)
library(dplyr)
library(lattice)
library(latticeExtra)
```

::: {.cell-output .cell-output-stderr}

```

Attaching package: 'latticeExtra'

The following object is masked from 'package:ggplot2':

    layer
```


:::
:::

::: {.cell}

```{.r .cell-code}
#| echo: false
#| label: setup
#| warning: false

data2 <- read_csv("sevan.csv")
data3 <- read_csv("ashotsk.csv")
data4 <- read_csv("azatan.csv")
data5 <- read_csv("gavar.csv")
data6 <- read_csv("maralik.csv")
data7 <- read_csv("panik.csv")
data8 <- read_csv("vazgen.csv")
data <- read_csv("artik.csv")
data_new <- data
data_new$year <- strftime(data_new$time, "%Y")
data_new$month <- strftime(data_new$time, "%m")
data_new$week <- strftime(data_new$time, "%w")
data |>
  ggplot(mapping = aes(x = pm2_5, y = pm1)) + geom_point(aes(col="state", size="popdensity")) + geom_smooth(method="loess", se=F) 
```

::: {.cell-output .cell-output-stderr}

```
Warning: Using size for a discrete variable is not advised.
```


:::

::: {.cell-output .cell-output-stderr}

```
Warning: Removed 353 rows containing non-finite outside the scale range
(`stat_smooth()`).
```


:::

::: {.cell-output .cell-output-stderr}

```
Warning: Removed 353 rows containing missing values or values outside the scale range
(`geom_point()`).
```


:::

::: {.cell-output-display}
![](dataAnalysis_files/figure-html/unnamed-chunk-2-1.png){width=672}
:::

```{.r .cell-code}
ggplot() + geom_smooth(data_new, mapping = aes(x = time, y = temperature)) + geom_smooth(data2, mapping = aes(x = time, y = temperature)) + geom_smooth(data3, mapping = aes(x = time, y = temperature)) +geom_smooth(data4, mapping = aes(x = time, y = temperature)) + geom_smooth(data5, mapping = aes(x = time, y = temperature)) + geom_smooth(data6, mapping = aes(x = time, y = temperature)) + geom_smooth(data7, mapping = aes(x = time, y = temperature)) + geom_smooth(data8, mapping = aes(x = time, y = temperature), color = "orange")
```

::: {.cell-output .cell-output-stderr}

```
Warning: Removed 1 row containing non-finite outside the scale range
(`stat_smooth()`).
```


:::

::: {.cell-output .cell-output-stderr}

```
Warning: Removed 41 rows containing non-finite outside the scale range
(`stat_smooth()`).
```


:::

::: {.cell-output .cell-output-stderr}

```
Warning: Removed 2 rows containing non-finite outside the scale range
(`stat_smooth()`).
```


:::

::: {.cell-output .cell-output-stderr}

```
Warning: Removed 1 row containing non-finite outside the scale range
(`stat_smooth()`).
```


:::

::: {.cell-output-display}
![](dataAnalysis_files/figure-html/unnamed-chunk-2-2.png){width=672}
:::

```{.r .cell-code}
ggplot() + geom_smooth(data_new, mapping = aes(x = time, y = pm1)) + geom_smooth(data2, mapping = aes(x = time, y = pm1)) + geom_smooth(data3, mapping = aes(x = time, y = pm1)) +geom_smooth(data4, mapping = aes(x = time, y = pm1)) + geom_smooth(data5, mapping = aes(x = time, y = pm1)) + geom_smooth(data6, mapping = aes(x = time, y = pm1)) + geom_smooth(data7, mapping = aes(x = time, y = pm1)) + geom_smooth(data8, mapping = aes(x = time, y = pm1), color = "orange")
```

::: {.cell-output .cell-output-stderr}

```
Warning: Removed 353 rows containing non-finite outside the scale range
(`stat_smooth()`).
Removed 1 row containing non-finite outside the scale range (`stat_smooth()`).
```


:::

::: {.cell-output .cell-output-stderr}

```
Warning: Removed 547 rows containing non-finite outside the scale range
(`stat_smooth()`).
```


:::

::: {.cell-output .cell-output-stderr}

```
Warning: Removed 2500 rows containing non-finite outside the scale range
(`stat_smooth()`).
```


:::

::: {.cell-output .cell-output-stderr}

```
Warning: Removed 2110 rows containing non-finite outside the scale range
(`stat_smooth()`).
```


:::

::: {.cell-output .cell-output-stderr}

```
Warning: Removed 18 rows containing non-finite outside the scale range
(`stat_smooth()`).
```


:::

::: {.cell-output-display}
![](dataAnalysis_files/figure-html/unnamed-chunk-2-3.png){width=672}
:::
:::

::: {.cell}

```{.r .cell-code}
#library(openair)
#data_new <- data_new[-c(4, 5, 15)]

#summaryPlot(data_new)
```
:::



```{}
```



::: {.cell}

```{.r .cell-code}
data |>
  ggplot(data, mapping = aes(x = pm1, y = time)) + 
  geom_point(stat="identity", size=6) 
```

::: {.cell-output .cell-output-stderr}

```
Warning: Removed 353 rows containing missing values or values outside the scale range
(`geom_point()`).
```


:::

::: {.cell-output-display}
![](dataAnalysis_files/figure-html/unnamed-chunk-4-1.png){width=672}
:::
:::

::: {.cell}

```{.r .cell-code}
data |>
  ggplot() + geom_point(mapping = aes(y = pm2_5, x = time, col="pm2,5", size="popdensity")) +  geom_point(mapping = aes(y = pm10, x = time, col="pm10", size="popdensity")) + geom_point(mapping = aes(y = pm1, x = time, col="pm1",  size="popdensity")) +
  labs(x = "date", y = "pm1, pm2, pm2,5", title = "The presence of pm1, pm2.5, pm10 in the air by months")
```

::: {.cell-output .cell-output-stderr}

```
Warning: Using size for a discrete variable is not advised.
```


:::

::: {.cell-output .cell-output-stderr}

```
Warning: Removed 353 rows containing missing values or values outside the scale range
(`geom_point()`).
Removed 353 rows containing missing values or values outside the scale range
(`geom_point()`).
Removed 353 rows containing missing values or values outside the scale range
(`geom_point()`).
```


:::

::: {.cell-output-display}
![](dataAnalysis_files/figure-html/unnamed-chunk-5-1.png){width=672}
:::
:::



```{}
```



::: {.cell}

```{.r .cell-code}
mydata <- data
library(openair)
data("mydata")
summaryPlot(selectByDate(mydata))
```

::: {.cell-output-display}
![](dataAnalysis_files/figure-html/unnamed-chunk-6-1.png){width=672}
:::
:::



\
\

