data {
  int<lower=0> N;
  int wager[N];
  int payout[N];
}
transformed data {
  real rtp[N];
  for (n in 1:N) {
    rtp[n] = payout[n];                          // Convert int to real...
    rtp[n] = rtp[n] / wager[n];                  // ... avoid int division!
  }
}
parameters {
  real mu;
  real<lower = 0> sigma;
}
model {
  rtp ~ normal(mu, sigma);
  mu ~ uniform(0.5, 1);                          // Prior
}
