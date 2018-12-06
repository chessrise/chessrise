import "bootstrap";
import { loadDynamicBannerText } from '../components/banner';

if(document.getElementById("banner")) {
loadDynamicBannerText();
}

// import {Chessground} from "chessground";

// if(document.getElementById("chessgame")) {
//   const options = { movable: {free: true}, addPieceZIndex: true};
//   const chessgame = Chessground(document.getElementById("chessgame"),options);
// // Chessground(document.body, config: Config);
// }

// import Chess from 'chess.js'
// const chess = new Chess();

import { toggleBoardOrientation } from '../components/chessgame'
import { displayGameInitialPosition } from '../components/chessgame'
import { toDests } from '../components/chessgame'
import { initialPosition } from '../components/chessgame'
import { arrowControls } from '../components/chessgame'
// import { playNextMove } from '../components/chessgame'
// import { playPreviousMove } from '../components/chessgame'
// import { printMoves } from '../components/chessgame'

if(document.getElementById("chessgame")) {
  toggleBoardOrientation();
  displayGameInitialPosition();
  initialPosition();
  // playNextMove();
  // playPreviousMove();
  arrowControls();
  // printMoves();
}



// console.log(chess);





