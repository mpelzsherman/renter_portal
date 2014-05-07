Rails.configuration.stripe = {
  secret_key:           :sk_test_nJ99EV9aVnizpyRlck55CCJg,
  publishable_key:      :pk_test_Jmk8rdGSNsnPQrPOFB43CPLL 
}
Stripe.api_key = Rails.configuration.stripe[:secret_key]
