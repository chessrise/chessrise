import "bootstrap";

import { loadDynamicBannerText } from '../components/banner';
if(document.getElementById("banner")) {
  loadDynamicBannerText();
}

import { initChessground } from "../components/chessgame";

if(document.getElementById("chessgame")) {
  initChessground();
}

window.initChessground = initChessground;










