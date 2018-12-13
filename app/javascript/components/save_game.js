const getMoves = () => {
  if (document.getElementById("save-game-button")) {

    const ltButton = document.getElementById("save-game-button")
    ltButton.addEventListener("click", (element) => {
      element.preventDefault();
      const movesContainer = document.getElementById("moves-create");
      const movesBold = movesContainer.querySelectorAll(".moves.moves-bold");
      const movesArray = new Array();
      const moves = movesBold.forEach((move) => {
        movesArray.push(move.innerText);
      })
      const token = document.getElementById("token").value;
      const white_player_first_name = document.getElementById("white_player_first_name").value;
      const black_player_first_name = document.getElementById("black_player_first_name").value;
      const white_player_last_name = document.getElementById("white_player_last_name").value;
      const black_player_last_name = document.getElementById("black_player_last_name").value;
      const collection_id = document.getElementById("collection-id").value;
      const result = document.querySelector('option:checked').value;
      $.ajax( {
        url: "/games",
        method: "POST",
        headers: { "X-CSRF-Token": token },
        dataType: "script",
        data: {movesArray: movesArray,
              white_player_first_name: white_player_first_name,
              black_player_first_name: black_player_first_name,
              white_player_last_name: white_player_last_name,
              black_player_last_name: black_player_last_name,
              collection_id: collection_id,
              result: result
              }
            })
    })
  };

};

export {getMoves};





