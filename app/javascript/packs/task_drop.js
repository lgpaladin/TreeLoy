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
        if(e.target.tagName != 'input') {
            console.log('MOUSEDOWN')
            current_task = e.target.closest('.task-block');
            current_task.style = 'width: 18rem; margin: 10px; z-index: 1000; position: absolute';
            lists.style = 'float: left; width: 24%; margin: 5px; height: 40vw; z-index: -1000';

            isDown = true;
            offset = [
                current_task.offsetLeft - e.clientX,
                current_task.offsetTop - e.clientY
            ];
        }
    };

/*    function findAncestor (el, cls) {
        while ((el = el.parentElement) && !el.classList.contains(cls));
        return el;
    }
*/
    var mouse_enter = function (e) {
        if (isDown) {
            console.log('MOUSEENTER')
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

    document.addEventListener('mouseover', mouse_enter, true);

    document.addEventListener('mouseup', function (e) {
        if(isDown) {
            console.log('MOUSEUP')
            isDown = false;

            current_task.style.position = 'initial'
            current_list = e.target.closest(".list-block")

            list_id = current_list.getAttribute('list_id')
            task_id = current_task.getAttribute('task_id')

            console.log(current_list.querySelector('.card-body'))
            console.log(task_id.toString() + " - " + list_id.toString())

            $.ajax({
                method: "PUT",
                url: "/projects/" + project_id + "/lists/" + list_id + "/tasks/" + task_id + ".json",
                data: {to_list: true}
            })
                .done(function (msg) {
                    current_list.querySelector('.card-body').appendChild(current_task)
                })
                .fail(function (jqXHR, textStatus) {
                    console.log("Request failed: " + textStatus);
                });
        }
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
});