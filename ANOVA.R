# 3 groups with sevel observations per group
y1 <- c(18.2, 20.1, 17.6, 16.8, 18.8, 19.7, 19.1)
y2 <- c(17.4, 18.7, 19.1, 16.4, 15.9, 18.4, 17.7)
y3 <- c(15.2, 18.8, 17.7, 16.5, 15.9, 17.1, 16.7)

# combine 3 groups into one long vector
y = c(y1, y2, y3)

# make another vector to identify groups
n = rep(7, 3)
group = rep(1:3, n)

# we need summary statistics for each group and overall
# write a function to do this
tmpfn <- function(x) {c(sum = sum(x), mean = mean(x), var = var(x), n = length(x))}
# results by group
tapply(y, group, tmpfn)
# overall statistics
tmpfn(y)

data <- data.frame(y = y, group = factor(group))
fit <- lm(y ~group, data)
anova(fit)
# f-value = 3.96 reject at a 5% l.o.s but fail to reject at a 1%

# a very obivious example
y1 <- c(1, 2, 3, 4, 5, 6, 7)
y2 <- c(8, 9, 10, 11, 12, 13, 14)
y3 <- c(15, 16, 17,18, 19, 20, 21)
y <- c(y1, y2, y3)
n = rep(7, 3)
group <- rep(1:3, n)
data <- data.frame(y = y, group = factor(group))
fit <- lm(y ~ group, data)
anova(fit)
# note the extremly high f value of 73.5. At least one of these groups is not the same.






