window.addEventListener("DOMContentLoaded", dropdownNavbar);
window.addEventListener("DOMContentLoaded", dropdownSearchByTag);

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

  btnNavbar[n].addEventListener("mouseover", drop);

  };

};


function dropdownSearchByTag() {

  let btnTag = document.getElementsByClassName("btn-drop-tag");
  let menuTag = document.getElementsByClassName("search-by-tag");
  let statusTag = false;

  function drop() {
    if (statusTag == false) {
      menuTag[0].style.height = "auto";
      statusTag = true;
    } else if (statusTag == true) {
      menuTag[0].style.height = "0px";
     statusTag = false;
    };
  };

  btnTag[0].addEventListener("mouseover", drop);

};