// Games are the list of dataset sender.
function dragGame() {
  console.log("drag");
  const games = document.querySelectorAll('.game-card');
  games.forEach((g) => {
    g.addEventListener("dragstart", function( event ) {
        event.dataTransfer.setData("text", g.dataset.uid);
        console.log(event.dataTransfer.getData("text"));
    }, false);
    g.addEventListener("dragend", function( event ) {
    }, false);
  });
};

// Collections are the list of dataset receiver.
function dropGame() {
  const collections = document.querySelectorAll('.collection-card');
  collections.forEach( (col)=> {
    col.addEventListener("dragenter", function( event ) {
      event.preventDefault();
      }, false);
    col.addEventListener("dragover", function( event ) {
      event.preventDefault();
      }, false);
    col.addEventListener("dragleave", function( event ) {
       event.preventDefault();
      }, false);
    col.addEventListener("drop", function( event ) {
      event.preventDefault();
      const collection = document.getElementById('chosen_collection');
      collection.value = col.dataset.uid;
      const game = document.getElementById('chosen_game');
      game.value = event.dataTransfer.getData("text");
      }, false);
    });
};

export {dragGame, dropGame};
