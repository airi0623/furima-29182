
window.addEventListener("load", () => {
  const categoryBtn = document.getElementById("category-btn");
  const pullDownCategory = document.getElementById("pull-down-category");
  const categoryLists = document.querySelectorAll(".category-list");
  
  
  // カテゴリーボタン
  categoryBtn.addEventListener('mouseover', function(){
    categoryBtn.setAttribute("style", "background-color:#3ccace; color:#FFF;");
  })
  categoryBtn.addEventListener('mouseout', function(){
    categoryBtn.removeAttribute("style", "background-color:#3ccace; color:#FFF;");
  })
  categoryBtn.addEventListener('mouseover', function() {
    if (pullDownCategory.getAttribute("style") == "display:inline;"){
      pullDownCategory.removeAttribute("style", "display:inline;")
    } else {
      pullDownCategory.setAttribute("style", "display:inline;")
    }
  })

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

