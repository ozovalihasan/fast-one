import { Controller } from "@hotwired/stimulus";
import { FetchRequest } from '@rails/request.js'

export default class extends Controller {
  static values = {
    url: String,
    method: String,
  };

  submit() {
    event.preventDefault();
    this._fetchNewPage();
  }

  async _fetchNewPage() {
    const request = new FetchRequest(
      this.methodValue || 'post', 
      this.urlValue,{  
        responseKind: "js"
      }
    )
    const response = await request.perform()
    if(response.ok){
      const body = await response.text
      eval(body)
    }
  }
}