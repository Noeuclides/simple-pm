import ApplicationController from './application_controller'

/* This is the custom StimulusReflex controller for the Tasks Reflex.
 * Learn more at: https://docs.stimulusreflex.com
 */
export default class extends ApplicationController {

  connect () {
    super.connect()
    // add your code here, if applicable
  }

  sort (event) {
    let tasks = document.querySelector("#tasks-list");
    let task_element = tasks.querySelectorAll(".task-item");
    let task_list = Array.from(task_element).map((task, index) => {
      return { id: task.dataset.taskId, position: (index + 1) }
    });
    tasks.dataset.tasks = JSON.stringify(task_list);
    this.stimulate('TasksReflex#sort', tasks);
  }


}
