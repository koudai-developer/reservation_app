document.addEventListener("turbolinks:load", () => {
  const dropDownStart = document.getElementById("dropdown-start");
  const dropDownMenu = document.getElementById("dropdown-menu");

  // トリガーをクリックしてメニューを開く/閉じる
  dropDownStart.addEventListener("click", function (event) {
    event.stopPropagation(); // クリックイベントの伝播を停止
    if (dropDownMenu.style.display === "block") {
      dropDownMenu.style.display = "none";
    } else {
      dropDownMenu.style.display = "block";
    }
  });

  // メニュー外をクリックしたときに閉じる
  document.addEventListener("click", function () {
    dropDownMenu.style.display = "none";
  });
});
