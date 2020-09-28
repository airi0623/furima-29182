function price() {
  const priceSeller = document.getElementById("item-price");
  const taxPrice = document.getElementById("add-tax-price");
  const profitPrice= document.getElementById("profit");
  // alert("ページ読み込んだ")検証用
  priceSeller.addEventListener("input",function(){
    const price = priceSeller.value
      if (price >= 300 && price <=9999999){
         taxPrice.innerHTML = Math.floor(price * 0.01);
         profitPrice.innerHTML = price - Math.floor(price * 0.01);
      } else {
        taxPrice.innerHTML = "--" ;
        profitPrice.innerHTML = "--" ; 
      }
  });
};

window.addEventListener("load", price); 


