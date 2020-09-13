window.addEventListener("load", () => {
  
  Payjp.setPublicKey("pk_test_9ccece7a5a4bd64940266c22")
  const form = document.getElementById("charge-form");
  form.addEventListener("submit",(e) => {
    e.preventDefault();
    
    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);
    // console.log(formResult)
    const card = {
      number: formData.get("number"),
      cvc: formData.get("cvc"),
      exp_month: formData.get("exp_month"),
      exp_year: `20${formData.get("exp_year")}`,
    };
    // カードの情報を送ってる
    // console.log(card)

    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;  //response.idがトークン
        // トークンが取得できてる
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} type="hidden" name='token'>`; //埋め込み型を決めてる
        renderDom.insertAdjacentHTML("beforeend", tokenObj); // ビューにトークンを埋め込んでる
        // console.log(token) 
        // console.log(renderDom) 
      //   alert("決済ができました")
      // }else{
      //   alert("決済に失敗しました。")
      // }

      document.getElementById("card-number").removeAttribute("name");
      document.getElementById("card-cvc").removeAttribute("name");
      document.getElementById("card-exp-month").removeAttribute("name");
      document.getElementById("card-exp-year").removeAttribute("name");

      document.getElementById("charge-form").submit();
      document.getElementById("charge-form").reset();
    });
  });
});