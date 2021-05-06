/* Loop through all dropdown buttons to toggle between hiding and showing its dropdown content - This allows the user to have multiple dropdowns without any conflict */
var dropdown = document.getElementsByClassName("dropdown-btn");
var i;

for (i = 0; i < dropdown.length; i++) {
  dropdown[i].addEventListener("click", function() {
  this.classList.toggle("active");
  var dropdownContent = this.nextElementSibling;
  if (dropdownContent.style.display === "block") {
  dropdownContent.style.display = "none";
  } else {
  dropdownContent.style.display = "block";
  }
  });
}
$(document).ready(function() {
			$(".tabList li:first").addClass("active");
			$(".tabcon .tabs").hide();
			$(".tabcon .tabs:first").show();
			$(".tabHead:first").addClass("active");

			$(".tabList a").click(function(t) {
				t.preventDefault();
				var tabid = $(this).attr("href");

				if (!($(".tabcon " + tabid).is(":visible"))) {
					$(".tabList li").removeClass("active");
					$(this).parent("li").addClass("active");
					$(".tabcon .tabs").hide();
					$(".tabcon " + tabid).show();
					$(".tabHead").removeClass("active");
					$(".tabcon " + tabid).prev(".tabHead").addClass("active");
				}
			});

			$(".tabList li:even").addClass("oddList");

			//h2 section start

			$(".tabHead").click(function() {
				var getId = "#" + $(this).next(".tabs").attr("id");
				$(".tabList li").removeClass("active");
				$('a[href="' + getId + '"]').parent("li").addClass("active");
				$(".tabcon .tabs").slideUp();
				$(this).next(".tabs").slideDown();
			});

			//h2 section end
		});

	
	
		// <![CDATA[  <-- For SVG support
		if ('WebSocket' in window) {
			(function() {
				function refreshCSS() {
					var sheets = [].slice.call(document
							.getElementsByTagName("link"));
					var head = document.getElementsByTagName("head")[0];
					for (var i = 0; i < sheets.length; ++i) {
						var elem = sheets[i];
						var parent = elem.parentElement || head;
						parent.removeChild(elem);
						var rel = elem.rel;
						if (elem.href && typeof rel != "string"
								|| rel.length == 0
								|| rel.toLowerCase() == "stylesheet") {
							var url = elem.href.replace(
									/(&|\?)_cacheOverride=\d+/, '');
							elem.href = url
									+ (url.indexOf('?') >= 0 ? '&' : '?')
									+ '_cacheOverride='
									+ (new Date().valueOf());
						}
						parent.appendChild(elem);
					}
				}
				var protocol = window.location.protocol === 'http:' ? 'ws://'
						: 'wss://';
				var address = protocol + window.location.host
						+ window.location.pathname + '/ws';
				var socket = new WebSocket(address);
				socket.onmessage = function(msg) {
					if (msg.data == 'reload')
						window.location.reload();
					else if (msg.data == 'refreshcss')
						refreshCSS();
				};
				if (sessionStorage
						&& !sessionStorage
								.getItem('IsThisFirstTime_Log_From_LiveServer')) {
					console.log('Live reload enabled.');
					sessionStorage.setItem(
							'IsThisFirstTime_Log_From_LiveServer', true);
				}
			})();
		} else {
			console
					.error('Upgrade your browser. This Browser is NOT supported WebSocket for Live-Reloading.');
		}