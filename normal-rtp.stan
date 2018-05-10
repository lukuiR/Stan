## @knitr stan_normal_rtp
data {
  int<lower=0> N;
  real rtp[N];
}
parameters {
  real<lower=0, upper=1> mu1;          // Payline 1 -> 1x
  real<lower=0, upper=1> mu2;          // Payline 2 -> 2x
  real<lower=0, upper=1> mu3;          // Payline 3 -> 5x
  real<lower=0, upper=1> mu4;          // Payline 4 -> 10x
  real<lower=0, upper=1> mu5;          // Payline 5 -> 20x
  real<lower=0, upper=1> mu6;          // Payline 6 -> 100x
  real<lower=0> sigma;
}
transformed parameters {
  real<lower=0> mu;
  mu = mu1 * 1 + mu2 * 2 + mu3 * 5 + mu4 * 10 + mu5 * 20 + mu6 * 100;
}
model {
  // The mean of lognormal() is exp(mu + sigma * sigma / 2).
  rtp ~ lognormal(log(mu) - sigma * sigma / 2, sigma);
  mu1 ~ beta(2, 2);                    // Mode = 0.5
  mu2 ~ beta(2, 4);                    // Mode = 0.25
  mu3 ~ beta(2, 5);                    // Mode = 0.2
  mu4 ~ beta(2, 8);                    // Mode = 0.125
  mu5 ~ beta(2, 10);                   // Mode = 0.1
  mu6 ~ beta(2, 16);                   // Mode = 0.0625
}
