if (document.URL.match( /new/ ) || document.URL.match( /edit/ )) {
  document.addEventListener('DOMContentLoaded', function(){
    const clickUpload= document.getElementById('click-upload-id');
    const imageBoxBig = document.getElementById("image-box-big-id");

    const createImageHTML = (blob,index) => {
      console.log(index)
      
      // blob・・・画像データ  index・・・番号
      const imageDataIndex = document.querySelector(`#image-box[data-index="${index}"]`);

      if (imageDataIndex === null){
      console.log("新規作成")
      const imageElementNum = document.querySelectorAll('#image-box').length

        // 画像を表示するためのdiv要素を生成
        const imageBox = document.createElement('div');
        imageBox.setAttribute('id', "image-box")
        imageBox.setAttribute('class', "image-box")
        imageBox.setAttribute('data-index', index)
              
        // 表示する画像を生成
        const blobImage = document.createElement('img');
        blobImage.setAttribute('src', blob);
        blobImage.setAttribute('class', 'image-size');

        // ファイル選択ボタンを生成
        const inputHTML = document.createElement('input')
        inputHTML.setAttribute('id', `item-image-${imageElementNum }`)
        inputHTML.setAttribute('name', 'item[images][]')
        inputHTML.setAttribute('type', 'file')
        inputHTML.setAttribute('class', 'click-btn')
        inputHTML.setAttribute('data-index', index+1)

        // ラベルのfor属性を変更
        clickUpload.setAttribute('for', `item-image-${imageElementNum }`)

        // 生成したHTMLの要素をブラウザに表示させる
        imageBox.appendChild(blobImage);        
        imageBoxBig.appendChild(imageBox);
        clickUpload.appendChild(inputHTML);

        // imageBoxBigの中に編集ボタン、削除ボタンを生成
        const HTML = `
            <div class = "change-box-edit-delete">
              <div class = "change-box" id = item-image-edit-${imageElementNum } data-index="${imageElementNum}" >編集</div>
              <div class = "change-box" id = item-image-delete-${imageElementNum } data-index="${imageElementNum}" >削除</div>
            </div>` ;
        imageBox.insertAdjacentHTML("beforeend", HTML);

        const editImage = document.getElementById(`item-image-edit-${imageElementNum }`);
        editImage.addEventListener('click',function(e){
          console.log("編集")
          const targetIndex = e.target.dataset.index; //専用のメソッド dataset getattrivuteでもいける？
          const fileField = document.querySelector(`input[type="file"][data-index="${targetIndex}"]`); //属性セレクター
          fileField.click();  //ボタンをクリックさせてる
          // const blobImage = imageDataIndex.querySelector('img');
          // blobImage.setAttribute('src', blob);
        });

        // ファイルにデータが入ったら再度発火
        inputHTML.addEventListener('change',(e) => {
          const file = e.target.files[0];
          const blob = window.URL.createObjectURL(file);
          const index = Number(e.target.dataset.index);
          createImageHTML(blob, index)
        });
      } else {
        const blobImage = imageDataIndex.querySelector('img');
        blobImage.setAttribute('src', blob);
        console.log("編集")
      }
      

    };

    document.getElementById('item-image').addEventListener('change', function(e){
      console.log(e)

      const file = e.target.files[0]; //1マイ限定なのでこの書き方
      const blob = window.URL.createObjectURL(file);
      // ↑fileをURLに変換している
      let index = Number(e.target.getAttribute('data-index'))
      // debugger
      createImageHTML(blob,index);
    });
  });
}
