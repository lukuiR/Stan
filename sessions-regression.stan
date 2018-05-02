## @knitr stan_regression
data {
  int<lower=0> N;
  vector[N] y;
  vector[N] x;
}
parameters {
  real alpha;
  real beta;
  real<lower=0> sigma;
}
model {
  // for (n in 1:N) y[n] ~ normal(alpha + beta * x[n], sigma);
  y ~ normal(alpha + beta * x, sigma); // Likelihood
  //
  alpha ~ normal(0, 10);               // Prior
  beta ~ normal(0, 10);                // Prior
  sigma ~ cauchy(0, 5);                // Prior
}