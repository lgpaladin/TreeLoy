$(document).ready(function() {
	
	console.log("1")
  
	//var checkboxes = document.getElementsByTagName('input');
	var checkboxes = document.getElementsByClassName('form-check');

  for (var i = 0; i < checkboxes.length; i++) {
// 	if (checkboxes[i].type === 'checkbox') {
    	checkboxes[i].addEventListener('change', checkbox_checked, true);
    	console.log(checkboxes[i])
//  }
  }

  var checkbox_checked = function (e) {
  	
  	console.log(e.target.getAttribute('id').toString + ' - ' + e.target.getAttribute('name') + ' - ' + e.target.getAttribute('value') + ' - ' + e.target.getAttribute('checked'))

    };

/*    function findAncestor (el, cls) {
        while ((el = el.parentElement) && !el.classList.contains(cls));
        return el;
    }
*/
/*    var mouse_enter = function (e) {
        if (isDown) {
            current_list = e.target.closest(".list-block")
            console.log(e.target) 
            console.log(current_list.getAttribute('list_id')) 
        }
    };

    for (var i = 0; i < cards.length; i++) {
        cards[i].addEventListener('mousedown', mouse_down, true);
    }

/*    for (var i = 0; i < lists.length; i++) {
      console.log(cards[i])    
        lists[i].addEventListener('mouseup', mouse_enter, false);
    }
*/

/*    document.addEventListener('mouseover', mouse_enter, true);

    document.addEventListener('mouseup', function (e) {

        isDown = false;
        current_task.style.position = 'initial'
        
        current_list = e.target.closest(".list-block")

        list_id = current_list.getAttribute('list_id')
        task_id = current_task.getAttribute('task_id')

        current_list.appendChild(current_task)

        console.log(task_id.toString() + " - " + list_id.toString())

        $.ajax({
          method: "PUT",
          url: "/projects/" + project_id + "/lists/" + list_id + "/tasks/" + task_id + ".json",
          data: { to_list: true}
        })
          .done(function( msg ) {
            alert( "Data Saved: " + msg );
            
            // перерисовать список правильной последовательности карт

          })
          .fail(function( jqXHR, textStatus ) {
            alert( "Request failed: " + textStatus );
        });

    }, true);

    document.addEventListener('mousemove', function (event) {
        event.preventDefault();
        if (isDown) {
            mousePosition = {

                x: event.clientX,
                y: event.clientY

            };

            current_task.style.position = 'absolute';
            current_task.style.left = (mousePosition.x + offset[0]) + 'px';
            current_task.style.top  = (mousePosition.y + offset[1]) + 'px';
        }
    }, true);
*/    
});