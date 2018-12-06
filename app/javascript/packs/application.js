import "bootstrap";

import { loadDynamicBannerText } from '../components/banner';
if(document.getElementById("banner")) {
  loadDynamicBannerText();
}

import { initChessground } from "../components/init_chessground";
import { toggleBoardOrientation } from '../components/chessgame'
import { displayGameInitialPosition } from '../components/chessgame'
import { initialPosition } from '../components/chessgame'
import { arrowControls } from '../components/chessgame'


if(document.getElementById("chessgame")) {
  toggleBoardOrientation();
  displayGameInitialPosition();
  initialPosition();
  arrowControls();
}

window.initChessground = initChessground;
// initChessground();









