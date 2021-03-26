import { Controller } from 'stimulus';

export default class TableController extends Controller {
  static targets = ['groupChild'];

  toggleGroup(event) {
    const { groupName } = event.target.parentElement.dataset;

    this.groupChildTargets.forEach((child) => {
      if (groupName === child.dataset.groupName) {
        child.classList.toggle('hidden');
      }
    });
  }
}
