function price (){
  const ItemPrice = document.getElementById("item-price");
  ItemPrice.addEventListener('keyup', () => {
  ItemValue = (ItemPrice.value);
  const Tax = 0.1;
  BeforeTaxPrice = ItemValue * Tax;
  TaxPrice = Math.round(BeforeTaxPrice)
  const AddTaxPrice = document.getElementById("add-tax-price");
  AddTaxPrice.innerHTML = TaxPrice;

  const profit = document.getElementById("profit");
  ItemProfit = ItemValue - TaxPrice;
  profit.innerHTML = ItemProfit;
});
}
window.addEventListener('load', price);


