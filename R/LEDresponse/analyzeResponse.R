library(tidyverse)
library(dplyr)
library(stringr)
library(MASS)

# First task is to combine all of the datasets into one.
# I'll only need the name, 5 LED columns, and 5 flag columns.
# The name should just be the first part truncated.

truncatedNames <- stringr::str_trunc(compiledInfo_1107039$Name, 5, c("right", "left", "center"), "")

compiledInfo_1107038 <- compiledInfo_1107038[order(compiledInfo_1107038$Name),]
compiledInfo_1107039 <- compiledInfo_1107039[order(compiledInfo_1107039$Name),]
compiledInfo_1107040 <- compiledInfo_1107040[order(compiledInfo_1107040$Name),]
compiledInfo_1107041 <- compiledInfo_1107041[order(compiledInfo_1107041$Name),]
compiledInfo_1107042 <- compiledInfo_1107042[order(compiledInfo_1107042$Name),]

fullDataSet <- data.frame("Name" = truncatedNames, 
                          #"Vm1p0_LED" = compiledInfo_1107038$LED, 
                          "Vm0p5_LED" = compiledInfo_1107039$LED, 
                          "Vnom_LED"  = compiledInfo_1107042$LED,
                          "Vp0p5_LED" = compiledInfo_1107040$LED,
                          "Vp1p0_LED" = compiledInfo_1107041$LED,
                          #"Vm1p0_flags" = compiledInfo_1107038$Flags, 
                          "Vm0p5_flags" = compiledInfo_1107039$Flags, 
                          "Vnom_flags"  = compiledInfo_1107042$Flags,
                          "Vp0p5_flags" = compiledInfo_1107040$Flags,
                          "Vp1p0_flags" = compiledInfo_1107041$Flags)

# Next I should just try to separate the Ecal and Hcal and make those two plots.

goodE <- fullDataSet %>% filter(substr(Name, 0, 1) == "E" & 
                                   #Vm1p0_flags == "0_Good" & 
                                   Vm0p5_flags == "0_Good" & 
                                   Vnom_flags == "0_Good" &
                                   Vp0p5_flags == "0_Good" &
                                   Vp1p0_flags == "0_Good")

goodE_notNorm <- fullDataSet %>% filter(substr(Name, 0, 1) == "E" & 
                                  #Vm1p0_flags == "0_Good" & 
                                  Vm0p5_flags == "0_Good" & 
                                  Vnom_flags == "0_Good" &
                                  Vp0p5_flags == "0_Good" &
                                  Vp1p0_flags == "0_Good")

goodEN <- fullDataSet %>% filter(substr(Name, 0, 2) == "EN" & 
                                   #Vm1p0_flags == "0_Good" & 
                                   Vm0p5_flags == "0_Good" & 
                                   Vnom_flags == "0_Good" &
                                   Vp0p5_flags == "0_Good" &
                                   Vp1p0_flags == "0_Good")

goodES <- fullDataSet %>% filter(substr(Name, 0, 2) == "ES" & 
                                   #Vm1p0_flags == "0_Good" & 
                                   Vm0p5_flags == "0_Good" & 
                                   Vnom_flags == "0_Good" &
                                   Vp0p5_flags == "0_Good" &
                                   Vp1p0_flags == "0_Good")

goodHN <- fullDataSet %>% filter(substr(Name, 0, 2) == "HN" & 
                                   #Vm1p0_flags == "0_Good" & 
                                   Vm0p5_flags == "0_Good" & 
                                   Vnom_flags == "0_Good" &
                                   Vp0p5_flags == "0_Good" &
                                   Vp1p0_flags == "0_Good")

goodHS <- fullDataSet %>% filter(substr(Name, 0, 2) == "HS" & 
                                   #Vm1p0_flags == "0_Good" & 
                                   Vm0p5_flags == "0_Good" & 
                                   Vnom_flags == "0_Good" &
                                   Vp0p5_flags == "0_Good" &
                                   Vp1p0_flags == "0_Good")



# Drop now redundant flags
columnsToKeep <- c("Name", "Vm0p5_LED", "Vnom_LED", "Vp0p5_LED", "Vp1p0_LED")
goodE <- goodE[columnsToKeep]
goodE_notNorm <- goodE[columnsToKeep]
goodEN <- goodEN[columnsToKeep]
goodES <- goodES[columnsToKeep]
goodHN <- goodHN[columnsToKeep]
goodHS <- goodHS[columnsToKeep]

# Normalize y values
#goodE$Vm1p0_LED <- goodE$Vm1p0_LED / goodE$Vnom_LED
goodE$Vm0p5_LED <- goodE$Vm0p5_LED / goodE$Vnom_LED
goodE$Vp0p5_LED <- goodE$Vp0p5_LED / goodE$Vnom_LED
goodE$Vp1p0_LED <- goodE$Vp1p0_LED / goodE$Vnom_LED
goodE$Vnom_LED <- goodE$Vnom_LED / goodE$Vnom_LED    # Nominal must be the last to change

#goodEN$Vm1p0_LED <- goodEN$Vm1p0_LED / goodEN$Vnom_LED
goodEN$Vm0p5_LED <- goodEN$Vm0p5_LED / goodEN$Vnom_LED
goodEN$Vp0p5_LED <- goodEN$Vp0p5_LED / goodEN$Vnom_LED
goodEN$Vp1p0_LED <- goodEN$Vp1p0_LED / goodEN$Vnom_LED
goodEN$Vnom_LED <- goodEN$Vnom_LED / goodEN$Vnom_LED

#goodES$Vm1p0_LED <- goodES$Vm1p0_LED / goodES$Vnom_LED
goodES$Vm0p5_LED <- goodES$Vm0p5_LED / goodES$Vnom_LED
goodES$Vp0p5_LED <- goodES$Vp0p5_LED / goodES$Vnom_LED
goodES$Vp1p0_LED <- goodES$Vp1p0_LED / goodES$Vnom_LED
goodES$Vnom_LED <- goodES$Vnom_LED / goodES$Vnom_LED

#goodHN$Vm1p0_LED <- goodHN$Vm1p0_LED / goodHN$Vnom_LED
goodHN$Vm0p5_LED <- goodHN$Vm0p5_LED / goodHN$Vnom_LED
goodHN$Vp0p5_LED <- goodHN$Vp0p5_LED / goodHN$Vnom_LED
goodHN$Vp1p0_LED <- goodHN$Vp1p0_LED / goodHN$Vnom_LED
goodHN$Vnom_LED <- goodHN$Vnom_LED / goodHN$Vnom_LED

#goodHS$Vm1p0_LED <- goodHS$Vm1p0_LED / goodHS$Vnom_LED
goodHS$Vm0p5_LED <- goodHS$Vm0p5_LED / goodHS$Vnom_LED
goodHS$Vp0p5_LED <- goodHS$Vp0p5_LED / goodHS$Vnom_LED
goodHS$Vp1p0_LED <- goodHS$Vp1p0_LED / goodHS$Vnom_LED
goodHS$Vnom_LED <- goodHS$Vnom_LED / goodHS$Vnom_LED


# All of the data is apparently in "wide" format and I need it in "long" format
#in order to plot it.
goodE_long <- goodE %>% reshape(varying = c("Vm0p5_LED", "Vnom_LED", "Vp0p5_LED", "Vp1p0_LED"), 
                                  v.names = "NormLED", 
                                  timevar = "Bias", 
                                  times = c(-0.5, 0, 0.5, 1.0), 
                                  direction = "long")

goodE_notNorm_long <- goodE_notNorm %>% reshape(varying = c("Vm0p5_LED", "Vnom_LED", "Vp0p5_LED", "Vp1p0_LED"), 
                                v.names = "NormLED", 
                                timevar = "Bias", 
                                times = c(-0.5, 0, 0.5, 1.0), 
                                direction = "long")

goodEN_long <- goodEN %>% reshape(varying = c("Vm0p5_LED", "Vnom_LED", "Vp0p5_LED", "Vp1p0_LED"), 
                                  v.names = "NormLED", 
                                  timevar = "Bias", 
                                  times = c(-0.5, 0, 0.5, 1.0), 
                                  direction = "long")

goodES_long <- goodES %>% reshape(varying = c("Vm0p5_LED", "Vnom_LED", "Vp0p5_LED", "Vp1p0_LED"), 
                                  v.names = "NormLED", 
                                  timevar = "Bias", 
                                  times = c(-0.5, 0, 0.5, 1.0), 
                                  direction = "long")

goodHN_long <- goodHN %>% reshape(varying = c("Vm0p5_LED", "Vnom_LED", "Vp0p5_LED", "Vp1p0_LED"), 
                                  v.names = "NormLED", 
                                  timevar = "Bias", 
                                  times = c(-0.5, 0, 0.5, 1.0), 
                                  direction = "long")

goodHS_long <- goodHS %>% reshape(varying = c("Vm0p5_LED", "Vnom_LED", "Vp0p5_LED", "Vp1p0_LED"), 
                                  v.names = "NormLED", 
                                  timevar = "Bias", 
                                  times = c(-0.5, 0, 0.5, 1.0), 
                                  direction = "long")

# Sort the new wide format data to cluster points from the same SiPM
goodE_long <- goodE_long[order(goodE_long$id),]
goodE_notNorm_long <- goodE_notNorm_long[order(goodE_notNorm_long$id),]
goodEN_long <- goodEN_long[order(goodEN_long$id),]
goodES_long <- goodES_long[order(goodES_long$id),]
goodHN_long <- goodHN_long[order(goodHN_long$id),]
goodHS_long <- goodHS_long[order(goodHS_long$id),]


# Plot the non-flagged data for each detector now
goodEN_long %>% ggplot(aes(Bias, NormLED, group = Name)) + 
  geom_point() + geom_line() +
  labs(title = "EN All Non-flagged Towers", x = expression("V - V"[nominal]), y = expression("LED/LED"[nominal]))

goodES_long %>% ggplot(aes(Bias, NormLED, group = Name)) + 
  geom_point() + geom_line() +
  labs(title = "ES All Non-flagged Towers", x = expression("V - V"[nominal]), y = expression("LED/LED"[nominal]))

goodHN_long %>% ggplot(aes(Bias, NormLED, group = Name)) + 
  geom_point() + geom_line() +
  labs(title = "HN All Non-flagged Towers", x = expression("V - V"[nominal]), y = expression("LED/LED"[nominal]))

goodHS_long %>% ggplot(aes(Bias, NormLED, group = Name)) + 
  geom_point() + geom_line() +
  labs(title = "HS All Non-flagged Towers", x = expression("V - V"[nominal]), y = expression("LED/LED"[nominal]))


# Here's some histograms of the LED values at V+1 bias setting
goodEN_long %>% filter(Bias == 1.0) %>% 
  ggplot(aes(NormLED)) + 
  geom_histogram(binwidth = 0.01, color = "black") + 
  labs(title = "EN Norm LED values at V+1 Bias", x = expression("LED/LED"[nominal]), y = "Towers") +
  xlim(1.8, 2.4) +
  ylim(0, 70)

goodES_long %>% filter(Bias == 1.0) %>% 
  ggplot(aes(NormLED)) + 
  geom_histogram(binwidth = 0.01, color = "black") + 
  labs(title = "ES Norm LED values at V+1 Bias", x = expression("LED/LED"[nominal]), y = "Towers")

goodHN_long %>% filter(Bias == 1.0) %>% 
  ggplot(aes(NormLED)) + 
  geom_histogram(binwidth = 0.01, color = "black") + 
  labs(title = "HN Norm LED values at V+1 Bias", x = expression("LED/LED"[nominal]), y = "Towers")

goodHS_long %>% filter(Bias == 1.0) %>% 
  ggplot(aes(NormLED)) + 
  geom_histogram(binwidth = 0.01, color = "black") + 
  labs(title = "HS Norm LED values at V+1 Bias", x = expression("LED/LED"[nominal]), y = "Towers")


# Separate ECal rows 1-30 and 31-34
EN_R1to30_Vp1 <- 
  goodEN_long %>% filter(Bias == 1.0 & Name < "EN660") %>% 
  ggplot(aes(NormLED)) + 
  geom_histogram(binwidth = 0.01, color = "black") + 
  labs(title = "EN Row 1-30 Norm LED values at V+1.0 Bias", x = expression("LED/LED"[nominal]), y = "Towers") +
  xlim(1.8, 2.4) +
  ylim(0, 70)

EN_R31to34_Vp1 <-
  goodEN_long %>% filter(Bias == 1.0 & Name >= "EN660") %>% 
  ggplot(aes(NormLED)) + 
  geom_histogram(binwidth = 0.01, color = "black") + 
  labs(title = "EN Row 31-34 Norm LED values at V+1.0 Bias", x = expression("LED/LED"[nominal]), y = "Towers") +
  xlim(1.8, 2.4) +
  ylim(0, 70)


EN_R1to30_Vm0p5 <- 
  goodEN_long %>% filter(Bias == -0.5 & Name < "EN660") %>% 
  ggplot(aes(NormLED)) + 
  geom_histogram(binwidth = 0.005, color = "black", alpha = 0.4) + 
  labs(title = "EN Row 1-30 Norm LED values at V-0.5 Bias", x = expression("LED/LED"[nominal]), y = "Towers") +
  xlim(0.52, 0.68) +
  ylim(0, 120)

EN_R31to34_Vm0p5 <-
  goodEN_long %>% filter(Bias == -0.5 & Name >= "EN660") %>% 
  ggplot(aes(NormLED)) + 
  geom_histogram(binwidth = 0.005, color = "black", alpha = 0.4) + 
  labs(title = "EN Row 31-34 Norm LED values at V-0.5 Bias", x = expression("LED/LED"[nominal]), y = "Towers") +
  xlim(0.52, 0.68) +
  ylim(0, 120)


EN_R1to30_Vm0p5
EN_R31to34_Vm0p5

#EN_R1to30_Vp1
#EN_R31to34_Vp1

# All ECal separated by rows
E_R1to30_Vm0p5 <- 
  goodE_long %>% filter(Bias == -0.5 & substr(Name, 3, 6) < "660") %>% 
  ggplot(aes(NormLED)) + 
  geom_histogram(binwidth = 0.005, color = "black", alpha = 0.4) + 
  labs(title = "ECal Rows 1-30 Normalized LED values at V-0.5 Bias", x = expression("LED/LED"[nominal]), y = "Number of SiPMs") +
  xlim(0.5, 0.7)
  #ylim(0, 120)

E_R31to34_Vm0p5 <-
  goodE_long %>% filter(Bias == -0.5 & substr(Name, 3, 6) >= "660") %>% 
  ggplot(aes(NormLED)) + 
  geom_histogram(binwidth = 0.005, color = "black", alpha = 0.4) + 
  labs(title = "ECal Rows 31-34 Normalized LED values at V-0.5 Bias", x = expression("LED/LED"[nominal]), y = "Number of SiPMs") +
  xlim(0.5, 0.7)
  #ylim(0, 120)

E_R1to30_Vm0p5
E_R31to34_Vm0p5




# All ECal separated by rows WITHOUT NORMALIZATION
E_notNorm_R1to30_Vm0p5 <- 
  goodE_notNorm_long %>% filter(Bias == -0.5 & substr(Name, 3, 6) < "660") %>% 
  ggplot(aes(NormLED)) + 
  geom_histogram(binwidth = 20, color = "black", alpha = 0.4) + 
  labs(title = "ECal Rows 1-30 Raw LED values at V-0.5 Bias", x = expression("LED"), y = "Number of SiPMs")
  #xlim(0.5, 0.7)
#ylim(0, 120)

E_notNorm_R31to34_Vm0p5 <-
  goodE_notNorm_long %>% filter(Bias == -0.5 & substr(Name, 3, 6) >= "660") %>% 
  ggplot(aes(NormLED)) + 
  geom_histogram(binwidth = 20, color = "black", alpha = 0.4) + 
  labs(title = "ECal Rows 31-34 Raw LED values at V-0.5 Bias", x = expression("LED"), y = "Number of SiPMs")
  #xlim(0.5, 0.7)
#ylim(0, 120)

E_notNorm_R1to30_Vm0p5
E_notNorm_R31to34_Vm0p5
