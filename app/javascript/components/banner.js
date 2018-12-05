import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["Improve your game", "Jump to the next level"],
    typeSpeed: 120,
    loop: true
  });
};

export { loadDynamicBannerText };


