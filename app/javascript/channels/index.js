// Load all the channels within this directory and all subdirectories.
// Channel files must be named *_channel.js.

const channels = require.context('.', true, /_channel\.js$/)
channels.keys().forEach(channels)

window.addEventListener('load', function(){

  const itemPrice = document.getElementById("item-price")
  itemPrice.addEventListener("input", function(){
    const inputValue = itemPrice.value;

    const addTaxPrice = document.getElementById("add-tax-price")
    addTaxPrice.innerHTML = (Math.floor(inputValue * 0.1));

    const profitNumber = document.getElementById("profit")
      const valueResult = inputValue * 0.1
      profitNumber.innerHTML = (Math.floor(inputValue - valueResult));
  })
})