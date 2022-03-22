  // Script to open and close sidebar
function w3_open() {
  document.getElementById("mySidebar").style.display = "block";
}

function w3_close() {
  document.getElementById("mySidebar").style.display = "none";
}
// close the modal when clicking outside of the modal box
const modals = ["contactModal", "flashmessagemodal"];

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    for(let i=0; i<modals.length; i++){
        // Get the modal
        let modal = document.getElementById(modals[i]);
        if (event.target == modal) {
          modal.style.display = "none";
        }
    }
}
