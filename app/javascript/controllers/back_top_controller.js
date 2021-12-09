import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["button"]

  static values = {
    scrollPosition: Number
  };

  
  initialize() {
    this.scroll = this.scroll.bind(this);
  }

  connect() {
    document.addEventListener("scroll", this.scroll);
    this.scrollPositionValue = 0
  }

  disconnect(){
    document.removeEventListener("scroll", this.scroll);
  }
  
  scrollTop() {
    document.body.scrollTop = 0;
    document.documentElement.scrollTop = 0;
  }

  scroll() {
    const mobileBreakPoint = 768
    if(document.documentElement.clientWidth >= mobileBreakPoint){
      if (document.documentElement.scrollTop > 50){
        this.buttonTarget.classList.remove("hidden")
      }else{
        this.buttonTarget.classList.add("hidden")
      }
    }else{
      if(document.documentElement.scrollTop < this.scrollPositionValue){
        this.buttonTarget.classList.remove("hidden")
      }else{
        this.buttonTarget.classList.add("hidden")
      }
    }
    this.scrollPositionValue = document.documentElement.scrollTop
  }

}