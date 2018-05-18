import Typed from 'typed.js';

function loadDynamicBannerText() {
  new Typed('#banner-typed-text', {
    strings: ["New Cocktails every party", "Funky fresh ingredients", "They're Coco nuts", "Add Yours now", "What is your favourite", "Innovative Ideas"],
    typeSpeed: 80,
    loop: true
  });
}

export { loadDynamicBannerText };
