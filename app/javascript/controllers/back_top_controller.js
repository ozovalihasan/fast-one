import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["button"]

  
  initialize() {
    this.scroll = this.scroll.bind(this);
  }

  connect() {
    document.addEventListener("scroll", this.scroll);
  }

  disconnect(){
    document.removeEventListener("scroll", this.scroll);
  }
  
  scrollTop() {
    document.body.scrollTop = 0;
    document.documentElement.scrollTop = 0;
  }

  scroll() {
    if (document.documentElement.scrollTop > 50){
      this.buttonTarget.classList.remove("hidden")
    }else{
      this.buttonTarget.classList.add("hidden")
    }
  }

}