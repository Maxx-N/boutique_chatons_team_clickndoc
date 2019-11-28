window.addEventListener("DOMContentLoaded", dropdownNavbar);
window.addEventListener("DOMContentLoaded", dropdownSearchByTag);

function dropdownNavbar() {

  var btnNavbar = document.getElementsByClassName("btn-navbar");
  var menuNavbar = document.getElementsByClassName("menu-navbar");
  var statusNavbar = [];

    for (var n = 0; n < btnNavbar.length; n++) {
      var st = statusNavbar.push(false);

      function drop() {
        if (statusNavbar[n] == false) {
          for (var i = 0; i < btnNavbar.length; i++) {
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


function dropdownSearchByTag() {

  var btnTag = document.getElementsByClassName("btn-drop-tag");
  var menuTag = document.getElementsByClassName("search-by-tag");
  var statusTag = false;

  function drop() {
    if (statusTag == false) {
      menuTag[0].style.height = "auto";
      statusTag = true;
    } else if (statusTag == true) {
      menuTag[0].style.height = "0px";
     statusTag = false;
    };
  };

  btnTag[0].addEventListener("click", drop);

};