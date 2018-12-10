import "bootstrap";

// js snippet needed for type js text effect on banner
import { loadDynamicBannerText } from '../components/banner';
if(document.getElementById("banner")) {
  loadDynamicBannerText();
}

// chessground js library needed for displaying games
import { initChessground } from "../components/chessgame";

if(document.getElementById("chessgame")) {
  initChessground();
}
window.initChessground = initChessground;


// // js snippet needed for navbar change on scroll
// import { initUpdateNavbarOnScroll } from '../components/navbar';
// initUpdateNavbarOnScroll()

// // js snippet needed for sticky navbar on scroll
// import { stickyFunction } from '../components/navbar';
// window.onscroll = function() {stickyFunction()};

