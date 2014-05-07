Rails.configuration.stripe = {
  publishable_key: ENV['PUBLISHABLE_KEY'],
  secret_key:      ENV['SECRET_KEY']
}
Stripe.api_key = Rails.configuartion.stripe[:secret_key]
