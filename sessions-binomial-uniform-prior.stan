data {
  int<lower=0> N;
  int hits[N];
  int spins[N];
}
parameters {
  real mu;
}
model {
  hits ~ binomial(spins, mu);          // Likelihood
  mu ~ uniform(0, 1);                  // Prior
}
