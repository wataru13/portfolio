// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()


require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require('jquery')
require('test.js')
// require ('slick-theme')
require('slick.js')
// require('slick2.js')

$("#particle").particleText({
    text: "リモシェア<br>感情共有しよう", // 表示させたいテキスト。改行の場合は<br>追加
    colors:["#ffff00","#ffa500", "#ffd700"],// パーティクルの色を複数指定可能
    speed: "high",  // slow, middle, high の3つから粒子が集まる速さを選択
  });