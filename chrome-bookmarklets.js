// Some inspiration taken from https://detailed.com/chrome-bookmarklets-seo/

// Search current domain on Google for 'x'
javascript:(function() { new Promise(setQuery => { var input = window.prompt('Enter your query:'); if (input) setQuery(input); }).then(query => { window.open('https://www.google.com/search?q=' + query + ' site:' + window.location.hostname); });})();

// Search current domain on Google for PDF files
javascript:window.open('https://www.google.com/search?&as_sitesearch=' + window.location.hostname + '&as_filetype=pdf');

// Generate txt file of first x links on current Google search webpage
javascript:var a = document.getElementsByTagName('a'), arr = '';for(var i=0; i<a.length; i++) if (a[i].ping && !a[i].href.includes('google'))arr +=('<p>' + a[i].href + '</p>');var newWindow = window.open();newWindow.document.write(arr);newWindow.document.close();

// Get current website statistics from similarweb
javascript:window.open('https://similarweb.com/website/'+window.location.host);

// Get page speed
javascript:location.href='https://developers.google.com/speed/pagespeed/insights/?url='+window.location

// Find common site issues
javascript:window.open('https://www.google.com/search?q=site%3A%27+window.location.hostname
+%27 inurl:demo OR inurl:/home/ OR inurl:test OR inurl:-2 OR inurl:screenshot OR inurl:sample OR inurl:portfolio OR inurl:landing');

// Show all NOFOLLOW links on the current webpage
javascript:var a = document.getElementsByTagName('a');for(var i=0; i<a.length; i++)if (a[i].rel === 'nofollow') {a[i].style.backgroundColor = 'red';a[i].style.fontSize = '2em'; }

// Find all dupes and browken pages using Copyscape
javascript:location.href='https://www.siteliner.com/'+ window.location.host

// Edit text on the current webpage
javascript:document.body.contentEditable = 'true'; document.designMode='on'; void 0
