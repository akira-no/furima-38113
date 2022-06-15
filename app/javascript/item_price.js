function priceCalculation(){

  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {

    const inputValue = priceInput.value;

    const taxPrice = document.getElementById("add-tax-price");
    const taxPriceProvisional = Math.trunc(inputValue * 0.1);
    
    const profit = document.getElementById("profit");
    const profitProvisional = Math.trunc(inputValue *0.9);
    
    taxPrice.innerHTML = taxPriceProvisional;
    profit.innerHTML = profitProvisional;   
  });
};

window.addEventListener('load', priceCalculation)