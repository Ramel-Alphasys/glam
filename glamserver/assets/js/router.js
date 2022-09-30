if (!sessionStorage.getItem("page")) {
	sessionStorage.setItem("page", 0);
}

if (sessionStorage.page === "0") {
	$("#server-content").load(
		`components/login.html`,
		function (response, status) {
			if (status === "error") {
				console.log("Output:  => $ => load login.html status: ", status);
			}
		}
	);
} else if (sessionStorage.page === "1") {
	$("#server-content").load(
		`components/dashboard.html`,
		function (response, status) {
			if (status === "error") {
				console.log("Output:  => $ => load dashboard.html status: ", status);
			}
		}
	);
}
