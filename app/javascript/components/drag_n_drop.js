// Games are the list of dataset sender.
function dragGame() {
  const games = document.querySelectorAll('.result-game-card');
  games.forEach((g) => {
    g.addEventListener("dragstart", function( event ) {
        event.dataTransfer.setData("text", g.dataset.uid);
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
      if ( event.target.className == "collection-card" ) {
         event.target.style.background = "#164055";
         event.target.style.color = "white";
            }
      }, false);
    col.addEventListener("dragover", function( event ) {
      event.preventDefault();
      }, false);
    col.addEventListener("dragleave", function( event ) {
       event.preventDefault();
       if ( event.target.className == "collection-card" ) {
         event.target.style.background = "";
         event.target.style.color = "#164055";
            }
      }, false);
    col.addEventListener("drop", function( event ) {
      event.preventDefault();
      const collection = document.getElementById('chosen_collection');
      collection.value = col.dataset.uid;
      const game = document.getElementById('chosen_game');
      game.value = event.dataTransfer.getData("text");
      document.getElementById("submit-button").click();
      }, false);
    });
};

export {dragGame, dropGame};
