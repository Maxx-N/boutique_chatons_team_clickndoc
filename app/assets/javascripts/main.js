window.addEventListener("DOMContentLoaded", dropdownNavbar);

function dropdownNavbar() {

  let btnNavbar = document.getElementsByClassName("btn-navbar");
  let menuNavbar = document.getElementsByClassName("menu-navbar");
  let statusNavbar = [];

  for (let n = 0; n < btnNavbar.length; n++) {
    var st = statusNavbar.push(false);

    function drop() {
      if (statusNavbar[n] == false) {
        for (let i = 0; i < btnNavbar.length; i++) {
          if ( i !== n) {
              menuNavbar[i].style.top = "";
              statusNavbar[i] = false;
          };
        };
        menuNavbar[n].style.top = "50px";
        statusNavbar[n] = true;
      } else if (statusNavbar[n] == true) {
        menuNavbar[n].style.top = "";
        statusNavbar[n] = false;
      };
    };

  btnNavbar[n].addEventListener("click", drop);

  };

};