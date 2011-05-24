// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

// Area drop down selector
function jumpToArea(sel) {
    if (sel.selectedIndex < 1) return;
    area = sel.options[sel.selectedIndex].value;
    
    if (document.location.pathname.match(/^\/accounts\/\d+/)) {
        document.location.href = document.location.pathname.replace(/\d+/, area)
    } else {
        document.location.href = '/operator/accounts/' + area + '/edit'
    }
}

// Hints code
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
$(document).ready(function() {
    prepareInputsForHints();
});
