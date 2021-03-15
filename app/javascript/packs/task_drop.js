$(document).ready(function() {
/*  console.log("1") */
    var cards = document.getElementsByClassName('task-block');
    var lists = document.getElementsByClassName('list-block');
    var project_id = document.getElementById('project-block').getAttribute('project_id');
    var isDown;
    var offset;
    var current_task;
    var current_list = lists[0];


    var mouse_down = function (e) {
/*      console.log('mouse_don'); */
        current_task = e.target.closest('.task-block');
        current_task.style = 'width: 18rem; margin: 10px; z-index: 1000; position: absolute';
        lists.style = 'float: left; width: 24%; margin: 5px; height: 40vw; z-index: -1000';
/*      console.log(current_task); */
        isDown = true;
        offset = [
            current_task.offsetLeft - e.clientX,
            current_task.offsetTop  - e.clientY
        ];
    };

    function findAncestor (el, cls) {
        while ((el = el.parentElement) && !el.classList.contains(cls));
        return el;
    }

    var mouse_enter = function (e) {
        if (isDown) {
            current_list = e.target.closest(".list-block")
            console.log(e.target) 
            console.log(current_list.getAttribute('list_id')) 
        }
    };

/*  console.log(cards)
    console.log(cards.length)   */ 
    for (var i = 0; i < cards.length; i++) {
/*      console.log(cards[i])    */
        cards[i].addEventListener('mousedown', mouse_down, true);
    }

/*    for (var i = 0; i < lists.length; i++) {
      console.log(cards[i])    
        lists[i].addEventListener('mouseup', mouse_enter, false);
    }
*/

    document.addEventListener('mouseover', mouse_enter, true);
/*  console.log("4")    */
    document.addEventListener('mouseup', function (e) {
/*      console.log('UP')   */
        isDown = false;
        current_task.style.position = 'initial'
        
        current_list = e.target.closest(".list-block")

        list_id = current_list.getAttribute('list_id')
        task_id = current_task.getAttribute('task_id')

        current_list.appendChild(current_task)

        console.log(task_id.toString() + " - " + list_id.toString())

        // AJAX call for changing List-card relation
        // change_list(card_id, list_id)

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
/*          console.log(current_task)
            console.log(mousePosition.x.toString() + " - " + mousePosition.y.toString())    */
            current_task.style.position = 'absolute';
            current_task.style.left = (mousePosition.x + offset[0]) + 'px';
            current_task.style.top  = (mousePosition.y + offset[1]) + 'px';
        }
    }, true);
});