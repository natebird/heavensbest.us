// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

function jumpToArea(sel) {
	if (sel.selectedIndex < 1) return;
	area = sel.options[sel.selectedIndex].value;
	
	if (document.location.pathname.match(/^\/areas\/\d+/)) {
		document.location.href = document.location.pathname.replace(/\d+/, area)
	} else {
		document.location.href = '/operator/areas/' + area
	}
}

// function addLoadEvent(func) {
//   var oldonload = window.onload;
//   if (typeof window.onload != 'function') {
//     window.onload = func;
//   } else {
//     window.onload = function() {
//       oldonload();
//       func();
//     }
//   }
// }

function prepareInputsForHints() {
	var inputs = document.getElementsByTagName("input");
	var selects = document.getElementsByTagName("select");
	var textareas = document.getElementsByTagName("textarea");
	
	attachHintsTo(inputs);
	attachHintsTo(selects);
	attachHintsTo(textareas);
}

function attachHintsTo(collection){
	for (var i=0; i<collection.length; i++){
		// test to see if the hint span exists first
		if (collection[i].parentNode.getElementsByTagName("span")[0]) {
			// the span exists!  on focus, show the hint
			collection[i].onfocus = function () {
				this.parentNode.getElementsByTagName("span")[0].style.display = "inline";
			}
			// when the cursor moves away from the field, hide the hint
			collection[i].onblur = function () {
				this.parentNode.getElementsByTagName("span")[0].style.display = "none";
			}
		}
	}
}
document.observe("dom:loaded", function() {
	prepareInputsForHints();
});