browser.tabs.query({active: true}).then(tabs => {
		
	const filtered = tabs.filter((tab) => {
		return typeof tab.url !== 'undefined'; 
	});

	if (filtered.length !== 1) return;

	const URL = filtered[0].url;
	browser.storage.local.get('port').then(obj => {	
		const port = obj.port || 8964;

		fetch(`http://localhost:${port}/?url=${URL}`).then(res => {
			if (res.status !== 200) {
				console.log(`status code: ${res.status}`);
			}
			window.close();
		}).catch(err => {
			console.error(err);

			document.querySelector('#message').innerHTML = '<h3>Error</h3><p>AirFox failed to connect to the main AirFox macOS app.</p><p>Please make sure that the AirFox app is running and the Addon\'s port number is configured corrected.</p><p>You can configure the port number at   <code>about:addones --> AirFox --> Preferences</code></p>';
		});	
	}, err => {
		console.log(`error: ${err}`);
	});

}, err => {
	console.log(err);
});