import "bootstrap";
import { loadDynamicBannerText } from '../components/banner';

if(document.getElementById("banner")) {
loadDynamicBannerText();
}

import {Chessground} from "chessground";

if(document.getElementById("chessgame")) {
  const options = { movable: {free: true}, addPieceZIndex: true};
  const chessgame = Chessground(document.getElementById("chessgame"),options);
// Chessground(document.body, config: Config);
}

import {toggleBoardOrientation} from '../components/chessgame'
import {displayGameInitialPosition} from '../components/chessgame'
import {movee4} from '../components/chessgame'

if(document.getElementById("chessgame")) {
  toggleBoardOrientation();
  displayGameInitialPosition();
  movee4();
}


import Chess from 'chess.js'

const chess = new Chess();
// console.log(chess);





