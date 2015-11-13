$(document).ready(function() {
	// alert("Hi");

	$('.favorite').click(function() {
		$(this).parent().text("Added to Favorites");
	})

	$('.unfinished').click(function() {
		$(this).parent().text("Sorry, you didn't like this.");
	})

	// $('#book_message').text("WOOF!... woof.");
});