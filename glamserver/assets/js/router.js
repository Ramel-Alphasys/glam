/**
 * @ Name: router.js
 * @ Purpose:
 * @ Author: Ramel Niño O. Empleo
 * @ Create Time: 2022-09-29 19:42:39
 * @ Modified by: Ramel Niño O. Empleo
 * @ Modified time: 2022-11-15 19:33:45
 * @ Change Log:
 */
$(document).ready(function () {
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
	} else if (sessionStorage.page === "product") {
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
			`components/product.html`,
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
					console.log("Output:  => $ => load product.html status: ", status);
				}
			}
		);
	} else if (sessionStorage.page === "transaction") {
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
			`components/transaction.html`,
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
					console.log("Output:  => $ => load product.html status: ", status);
				}
			}
		);
	} else if (sessionStorage.page === "newTransaction") {
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
			`components/newTransaction.html`,
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
					console.log("Output:  => $ => load newTransaction.html status: ", status);
				}
			}
		);
	} else if (sessionStorage.page === "userSettings") {
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
			`components/userPage.html`,
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
					console.log("Output:  => $ => load userPage.html status: ", status);
				}
			}
		);
	}
});
