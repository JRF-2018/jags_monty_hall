## Version: 0.0.1
## Time-stamp: <2020-04-18T10:10:56Z>

library(rjags)

cat("\nThe Standard Monty Hall Problem: the Simplest Model\n")
m <- jags.model('monty_hall_1.jag', list(), list(list(d = 1, md = 1)), n.chains=1)
update(m, 10000)
post.list <- coda.samples(m, c('choose1', 'choosem', 'pi'), n.iter=10000)
print(summary(post.list))


cat("\nAnother version of the Monty Hall Problem\n")
m <- jags.model('monty_hall_2.jag', list(), list(list(pi = c(0.1, 0.1, 0.1), pi2 = c(0.1, 0.1), d = 1, md = 2)), n.chains=1)
update(m, 10000)
post.list <- coda.samples(m, c('choose1', 'choosem', 'pi', 'pi2'), n.iter=10000)
print(summary(post.list))


cat("\nThe Standard Monty Hall Problem\n")

m <- jags.model('monty_hall_3.jag', list(), list(list(pi = c(0.1, 0.1, 0.1), pi2 = c(0.1, 0.1), d = 1, md = 2)), n.chains=1)
update(m, 10000)
post.list <- coda.samples(m, c('choose1', 'choosem', 'pi', 'pi2'), n.iter=10000)
print(summary(post.list))
