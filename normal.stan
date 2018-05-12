## @knitr stan_normal
data {
  int<lower=0> N;
  real rtp[N];
}
parameters {
  real mu;
  real<lower = 0> sigma;
}
model {
  rtp ~ normal(mu, sigma);
  mu ~ beta(2, 2);                     // Mode = 0.5
}
