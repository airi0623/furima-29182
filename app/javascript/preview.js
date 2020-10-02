if (document.URL.match( /new/ ) || document.URL.match( /edit/ )) {
  document.addEventListener('DOMContentLoaded', function(){
    const ImageList = document.getElementById('image-list');

    const createImageHTML = (blob,index) => {
      // blob・・・画像データ  index・・・番号
      const imageDataIndex = document.querySelector(`#image-element[data-index="${index}"]`);

      if (imageDataIndex === null){
      console.log("aaa")
        // 画像を表示するためのdiv要素を生成
        const imageElement = document.createElement('div');
        imageElement.setAttribute('id', "image-element")
        imageElement.setAttribute('data-index', index)
        const imageElementNum = document.querySelectorAll('#image-element').length

        // 表示する画像を生成
        const blobImage = document.createElement('img');
        blobImage.setAttribute('src', blob);
        blobImage.setAttribute('class', 'image-size');

        // ファイル選択ボタンを生成
        const inputHTML = document.createElement('input')
        inputHTML.setAttribute('id', `item_image_${imageElementNum}`)
        inputHTML.setAttribute('name', 'item[images][]')
        inputHTML.setAttribute('type', 'file')
        // inputHTML.setAttribute('style', 'display :none ;')

        // 生成したHTMLの要素をブラウザに表示させる
        imageElement.appendChild(blobImage);
        imageElement.appendChild(inputHTML);
        ImageList.appendChild(imageElement);

        inputHTML.addEventListener('change',(e) => {
          const file = e.target.files[0];
          const blob = window.URL.createObjectURL(file);
          // let index = index + 1
          createImageHTML(blob,index + 1)
        })
      } else {
        console.log("bbb")
        const blobImage = imageDataIndex.querySelector('img');
        // imageDataIndex.setAttribute('src', blob)
        blobImage.setAttribute('src', blob);


      }
    };

    document.getElementById('item-image').addEventListener('change', function(e){
      const file = e.target.files[0];
      const blob = window.URL.createObjectURL(file);
      // ↑fileをURLに変換している
      let index = Number(e.target.getAttribute('data-index'))
      console.log(index)
      createImageHTML(blob,index);
    });
  });
}

// // 画像が表示されている場合のみ、すでに存在している画像を削除する
// console.log(123);
// const imageContent = document.querySelector('img');
// if (imageContent){
//   imageContent.remove();
// }

//  console.log(imageElement)
      //  console.log(imageElementNum)