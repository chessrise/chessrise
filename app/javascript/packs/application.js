import "bootstrap";
import { loadDynamicBannerText } from '../components/banner';

if(document.getElementById("banner")) {
loadDynamicBannerText();
}

import { toggleBoardOrientation } from '../components/chessgame'
import { displayGameInitialPosition } from '../components/chessgame'
import { toDests } from '../components/chessgame'
import { initialPosition } from '../components/chessgame'
import { arrowControls } from '../components/chessgame'


if(document.getElementById("chessgame")) {
  toggleBoardOrientation();
  displayGameInitialPosition();
  initialPosition();

  arrowControls();
}







