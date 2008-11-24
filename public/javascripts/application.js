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