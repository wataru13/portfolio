$(document).on('ready', function() {
    $(".regular_3").slick({
      dots: true, // ドットインジケーターの表示
      infinite: true, // スライドのループを有効にするか
      slidesToShow: 3, // 表示するスライド数を設定
      slidesToScroll: 3 // スクロールするスライド数を設定
    });
  });