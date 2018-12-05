import "bootstrap";
import { loadDynamicBannerText } from '../components/banner';

if(document.getElementById("banner")) {
loadDynamicBannerText();
}

import { Chessground } from "chessground";

if(document.getElementById("chessgame")) {
Chessground(document.getElementById("chessgame"));
}

// Chessground(document.body, config: Config);
