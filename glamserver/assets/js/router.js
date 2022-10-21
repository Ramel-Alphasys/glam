if (!sessionStorage.getItem("page")) {
	sessionStorage.setItem("page", 0);
}

if (sessionStorage.page === "0") {
	$("#server-header").html("");
	$("#server-content").load(
		`components/login.html`,
		function (response, status) {
			if (status === "error") {
				console.log("Output:  => $ => load login.html status: ", status);
			}
		}
	);
} else if (sessionStorage.page === "1") {
	$("#server-header").load(
		`components/headerNavigation.html`,
		function (response, status) {
			if (status === "error") {
				console.log(
					"Output:  => $ => load headerNavigation.html status: ",
					status
				);
			}
		}
	);
	$("#server-content").load(
		`components/dashboard.html`,
		function (response, status) {
			$("#leftSideNavigation").load(
				`components/sideNavigation.html`,
				function (response, status) {
					if (status === "error") {
						console.log(
							"Output:  => $ => load sideNavigation.html status: ",
							status
						);
					}
				}
			);
			if (status === "error") {
				console.log("Output:  => $ => load dashboard.html status: ", status);
			}
		}
	);
}
//Open submenu on hover in compact sidebar mode and horizontal menu mode
$(".navbar-toggler").on("click", (elem) => {
	console.log("Output:  => $ => elem", elem);
	var body = $("main"),
		sidebarIconOnly = body.hasClass("sidebar-icon-only"),
		sidebarFixed = body.hasClass("sidebar-fixed");
	if (sidebarIconOnly) {
		if (sidebarFixed) {
			if (elem.type === "mouseenter") {
				body.removeClass("sidebar-icon-only");
			}
		} else {
			var $menuItem = $(this);
			if (elem.type === "mouseenter") {
				$menuItem.addClass("hover-open");
			} else {
				$menuItem.removeClass("hover-open");
			}
		}
	}
});
