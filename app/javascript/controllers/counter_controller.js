import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static values = { count: Number }

    static targets = ["output"]

    connect(){
        this.outputTarget.value = this.countValue;
    }

    increase() {
        event.preventDefault();
        this.countValue ++;
        this.outputTarget.value = this.countValue;
    }
    decrease() {
        event.preventDefault();
        if (this.countValue > 1){
            this.countValue --;
        }
        this.outputTarget.value = this.countValue;
    }
}