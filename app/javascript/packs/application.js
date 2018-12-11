import "bootstrap";

// js snippet needed for type js text effect on banner
import { loadDynamicBannerText } from '../components/banner';
if(document.getElementById("banner")) {
  loadDynamicBannerText();
}

// chessground js library needed for displaying games
import { initChessground } from "../components/chessgame";
import { initChessgroundInput } from "../components/chessgame";
import { initChessgroundFind } from "../components/chessgame";
import { initChessgroundFindFen } from "../components/chessgame";

if(document.getElementById("chessgame")) {
  initChessground();
}
window.initChessground = initChessground;

if(document.getElementById("chessgame-input")) {
  initChessgroundInput();
}
window.initChessgroundInput = initChessgroundInput;

// if(document.getElementById("chessgame-find")) {
//   initChessgroundFind();
// }
// window.initChessgroundFind = initChessgroundFind;

if(document.getElementById("chessgame-find")) {
  console.log("in application");
  const fen = document.getElementById("fen");
  initChessgroundFindFen(fen.dataset.fen);
}
window.initChessgroundFindFen = initChessgroundFindFen;

import {getMoves} from "../components/save_game";
getMoves();

window.getMoves = getMoves;

import {dragGame, dropGame} from "../components/drag_n_drop";
dragGame();
dropGame();

// // js snippet needed for navbar change on scroll
// import { initUpdateNavbarOnScroll } from '../components/navbar';
// initUpdateNavbarOnScroll()

// // js snippet needed for sticky navbar on scroll
// import { stickyFunction } from '../components/navbar';
// window.onscroll = function() {stickyFunction()};

