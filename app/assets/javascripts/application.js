// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

const initiateStripe = (stripeForm) => {
  const stripe = Stripe('pk_test_uR9GcPekr9XBwQaKt3OnPuxe00Drts28Dd')
  const elements = stripe.elements()
  let cardNumber = elements.create('cardNumber')
  let cardExpiry = elements.create('cardExpiry')
  let cardCVC = elements.create('cardCvc')
  cardNumber.mount('#card-number')
  cardExpiry.mount('#card-expiry')
  cardCVC.mount('#card-cvc')

  stripeForm.addEventListener('submit', () => {
    event.preventDefault()
    stripe.createToken(cardNumber, cardExpiry, cardCVC)
      .then((result) => {
        const hiddenField = document.createElement('input')
        hiddenField.setAttribute('type', 'hidden')
        hiddenField.setAttribute('name', 'stripeToken')
        hiddenField.setAttribute('value', result.token.id)
        stripeForm.appendChild(hiddenField)
        stripeForm.submit()
      })
  })
}
document.addEventListener('turbolinks:load', () => {
  let stripeForm = document.getElementById('charge_form')
  if (stripeForm) {
    initiateStripe(stripeForm)
  }
})