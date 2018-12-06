import "bootstrap";

import { loadDynamicBannerText } from '../components/banner';
import { initChessground } from "../components/init_chessground";

window.initChessground = initChessground;
initChessground();

if(document.getElementById("banner")) {
  loadDynamicBannerText();
}

// LES GARS : NE SURTOUT PAS SUPPRIMER LE CODE CI-DESSOUS SVP !!!
// import {toggleBoardOrientation} from '../components/chessgame'
// import {displayGameInitialPosition} from '../components/chessgame'
// import {movee4} from '../components/chessgame'

// if(document.getElementById("chessgame")) {
//   toggleBoardOrientation();
//   displayGameInitialPosition();
//   movee4();
// }


import Chess from 'chess.js'

const chess = new Chess();
// console.log(chess);





