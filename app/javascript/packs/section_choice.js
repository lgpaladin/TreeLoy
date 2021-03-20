$(document).ready(function() {
	// console.log('In here')
	// var checkboxes = document.getElementsByClassName('section-point');
	// var checkbox_checked = function (e) {
	// 	console.log('In checkbox_checked')
	// 	console.log(e.target)
	// };
	// for (var i = 0; i < checkboxes.length; i++) {
	// 	checkboxes[i].addEventListener('change', checkbox_checked, true);
	// }
	$('.section-point').change(function () {
		console.log(this)
		if ($(this).is(':checked')) {
			// 1 найти все таски с этой секцией и 2 показать их
			$('.in_section_'+this.value).show()
		} else {
			// найти все таски с этой секцией и скрыть их
			$('.in_section_'+this.value).hide()
		}
	});
});