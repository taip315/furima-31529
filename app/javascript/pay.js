function payCalc(){
  const inputPrice = document.getElementById("item-price")
  inputPrice.addEventListener('input',function(){
  let price = inputPrice.value
  document.getElementById('add-tax-price').innerText = Math.floor(price*0.1)
  document.getElementById('profit').innerText = price-Math.floor(price*0.1)
  })
}
window.addEventListener('load', payCalc) 