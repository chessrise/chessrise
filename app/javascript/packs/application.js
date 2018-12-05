import "bootstrap";
import { loadDynamicBannerText } from '../components/banner';

loadDynamicBannerText();

import { Chessground } from "chessground";

Chessground(document.getElementById("chessgame"));

// Chessground(document.body, config: Config);
