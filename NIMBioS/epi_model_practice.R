require(EpiModel)
require(deSolve)

#example of SI model
param <- param.dcm(inf.prob = 0.2, act.rate = 0.25) #set infection probability and contact rate
init <- init.dcm(s.num = 500, i.num = 1) #intial numbers in each compartment
control <- control.dcm(type = "SI", nsteps = 500) #specify model type and time steps

mod <- dcm(param, init, control) #run an SI model with 500 time steps and save into object
mod #see summary output of dcm

plot(mod)
summary(mod, at = 150) #state of system at t = 150 (number and percent in each compartment, SI flow)

#try doing an SIR model, no vital dynamics
param <- param.dcm(inf.prob = 0.2, act.rate = 0.25, rec.rate = 0.01) #additional recovery rate parameter
init <- init.dcm(s.num = 500, i.num = 1, r.num = 0)
control <- control.dcm(type = "SIR", nsteps = 500) #specify and SIR model
mod <- dcm(param, init, control) #run SIR model w/ previous conditions
mod #note, we now have si.flow (incidence) and ir.flow

plot(mod)
summary(mod, at = 200)
mod_data <- as.data.frame(mod)

#maximum infections
max_inf <- c(max(mod_data$i.num), max(mod_data$i.num)/mod_data$num[1])
max_inf #number and percentage of pop

#try an SIR with vital dynamics
param <- param.dcm(inf.prob = 0.2, act.rate = 5,
                   rec.rate = 1/3, b.rate = 1/90, 
                   ds.rate = 1/100, di.rate = 1/35, dr.rate = 1/100)
init <- init.dcm(s.num = 500, i.num = 1, r.num = 0)
control <- control.dcm(type = "SIR", nsteps = 500)

mod_1 <- dcm(param, init, control)
mod_data1 <- as.data.frame(mod_1)

plot(mod_1)#note initial oscillations, then steady growth of S and R, still some endemic infection

max_inf1 <- c(max(mod_data1$i.num), max(mod_data1$i.num)/mod_data1$num[1]) #need to change this, n is changing so percentage is wrong
max_inf1 #number and percentage of pop

which(mod_data1$i.num==max_inf1[1]) #epidemic peak at t = 12

#try a 2 group SIR, no vital dynamics: g1 is more competent and populous that g2
param <- param.dcm(inf.prob = 0.2, act.rate = 5, rec.rate = 1/3, #g1 
                   inf.prob.g2 = 0.1, act.rate.g2 = NA, rec.rate.g2 = 1/2, #g2
                   balance = "g1") #balance av. contact rate between g1 and g2
init <- init.dcm(s.num = 400, i.num = 1, r.num = 0, #inf og in g1
                 s.num.g2 = 100, i.num.g2 = 0, r.num.g2 = 0) 
control <- control.dcm(type = "SIR", nsteps = 500)

mod_2 <- dcm(param, init, control)
mod_data2 <- as.data.frame(mod_2)

plot(mod_2, xlim = c(0,30)) 

#lets look at when epidemic peaks for g1 and g2, compare prop of num.i at peak
max_inf_g1 <- c(max(mod_data2$i.num), max(mod_data2$i.num)/mod_data2$num[1])
max_inf_g2 <- c(max(mod_data2$i.num.g2), max(mod_data2$i.num.g2)/mod_data2$num.g2[1])

max_inf_g1 #note, similar percentages of inf. during peak in g1, g2
max_inf_g2

which(mod_data2$i.num==max_inf_g1[1]) #t = 9
which(mod_data2$i.num.g2==max_inf_g2[1]) #t = 8, yup it peaks sooner; is this always the case?

#try SIR model with, 2 groups, vital processes
#g1 more competant host, r-selected demography
#g2 less competant host, k-selected demography
#constant death rates for each group, no infection caused death

param <- param.dcm(inf.prob = 0.2, act.rate = 5, rec.rate = 1/3, #g1 
                   b.rate = 1/40, ds.rate = 1/280, di.rate = 1/280, dr.rate = 1/280,
                   inf.prob.g2 = 0.1, act.rate.g2 = NA, rec.rate.g2 = 1/2, #g2
                   b.rate.g2 = 1/50, ds.rate.g2 = 1/200, di.rate.g2 = 1/200, dr.rate.g2 = 1/200 , 
                   balance = "g1") #balance av. contact rate between g1 and g2)

init <- init.dcm(s.num = 400, i.num = 1, r.num = 0, #inf og in g1
                         s.num.g2 = 100, i.num.g2 = 0, r.num.g2 = 0)
control <- control.dcm(type = "SIR", nsteps = 100, dt = 0.2)

mod_3 <- dcm(param, init, control)
mod_data3 <- as.data.frame(mod_3)
plot(mod_3)


     