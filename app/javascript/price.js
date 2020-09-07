function price() {
  const priceSeller = document.getElementById("item-price");
  const taxPrice = document.getElementById("add-tax-price");
  const profitPrice= document.getElementById("profit");

  priceSeller.addEventListener("input",function(){
    // console.log(e)入力した時に挙動が見られる
    // console.log(priceSeller)
    const price = priceSeller.value
      taxPrice.innerHTML = Math.floor(price * 0.01);
      profitPrice.innerHTML = Math.floor(price * 0.09);
  });
};

window.addEventListener("turbolinks:load", price); // turbolinks:load Javascript 