function saveOptions(e) {
	e.preventDefault();
	browser.storage.local.set({
		port: document.querySelector('#port').value
	});
}

function restoreOptions() {

	browser.storage.local.get('port').then(obj => {	
		document.querySelector('#port').value = obj.port || 8964;
	}, err => {
		console.log(`error: ${err}`);
	});
	
}

document.addEventListener("DOMContentLoaded", restoreOptions);
document.querySelector("form").addEventListener("submit", saveOptions);