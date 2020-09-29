
window.addEventListener("load", () => {
  const categoryBtn = document.getElementById("category-btn");
  const pullDownCategory = document.getElementById("pull-down-category");
  const categoryLists = document.querySelectorAll(".category-list");
  
  // カテゴリーボタン、リスト表示の有無
  categoryBtn.addEventListener('mouseover', function(){
    categoryBtn.setAttribute("style", " color:#3ccace;");
  })
  categoryBtn.addEventListener('mouseout', function(){
    categoryBtn.removeAttribute("style", "color:#3ccace;");
  })

  // categoryBtn.addEventListener('mouseover', function() {
  //   if (pullDownCategory.getAttribute("style") == "display:inline;"){
  //     pullDownCategory.removeAttribute("style", "display:inline;")
  //   } else {
  //     pullDownCategory.setAttribute("style", "display:inline;")
  //   }
  // })

  // pullDownCategory.addEventListener('mouseout', function() {
  //   if (pullDownCategory.getAttribute("style") == "display:inline;"){
  //     pullDownCategory.removeAttribute("style", "display:inline;")
  //   } 
  // })

  document.querySelector('.lists-left').addEventListener('mouseover', function() {
    pullDownCategory.setAttribute("style", "display:block;")
  })
  
  // categoryLists.forEach(function(element){
    document.querySelector('.lists-left').addEventListener('mouseout', function() {
      pullDownCategory.setAttribute("style", "display:none;")
    })
  // })

  // ボタンカラー
  categoryLists.forEach(function(element){
    element.addEventListener('mouseover', function(){
      element.setAttribute("style", "background-color:#3ccace; color:#FFF;");
    })
    element.addEventListener('mouseout', function(){
      element.removeAttribute("style", "background-color:#3ccace; color:#000000");
    })
  })
});

