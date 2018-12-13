function selectCollection() {
  const collections = document.querySelectorAll('.collection-card');
  collections.forEach((element) => {
      element.addEventListener('click', (event) => {
        element.classList.add('collection-card-persist');
        collections.forEach((element) => {
        element.classList.remove('collection-card-persist');
      });
      element.classList.add('collection-card-persist');
    })
  });
};

function selectResult() {
  const results = document.querySelectorAll('.result-game-card');
  results.forEach((element) => {
      element.addEventListener('click', (event) => {
        element.classList.add('game-card-persist');
        results.forEach((element) => {
        element.classList.remove('game-card-persist');
      });
      element.classList.add('game-card-persist');
    })
  });
};

export { selectCollection, selectResult };
