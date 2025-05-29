import { Controller } from "@hotwired/stimulus";
import flatpickr from "flatpickr";

// Connects to data-controller="datepicker"
export default class extends Controller {
  static values = {
    dates: Array
  }
  connect() {
    flatpickr(this.element, {
      disable: this.datesValue,
      dateFormat: "Y-m-d",
      minDate: "today",
      mode: "range",
        onChange: (selectedDates) => {
          if (selectedDates.length === 2) {
            const [entry, out] = selectedDates;
            const form = this.element.closest("form");
            const entryField = form.querySelector('input[name="booking[entry_date]"]');
            const outField = form.querySelector('input[name="booking[out_date]"]');

            if (entryField && outField) {
              entryField.value = flatpickr.formatDate(entry, "Y-m-d");
              outField.value = flatpickr.formatDate(out, "Y-m-d");
            }
          }
        }
    })
  }
}
