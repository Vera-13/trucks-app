import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static targets = ['content'];

  toggle(event) {
    const question = event.currentTarget.parentElement;
    question.classList.toggle('active');

    // Close other questions
    const allQuestions = this.element.querySelectorAll('.question');
    allQuestions.forEach((q) => {
      if (q !== question) {
        q.classList.remove('active');
        q.querySelector('.question-content').style.display = 'none';
      }
    });

    // Toggle current question content
    const content = question.querySelector('.question-content');
    if (question.classList.contains('active')) {
      content.style.display = 'block';
    } else {
      content.style.display = 'none';
    }
  }
}
