import { Controller } from "@hotwired/stimulus"
import { get } from '@rails/request.js'

export default class extends Controller {
  static targets = [ "input", "category" ]

  static values = {
    url: String,
    searchTerm: String,
  };

  search() {
    clearTimeout(this.timeout)
    this.timeout = setTimeout(() => {
      this._fetchNewPage();
    }, 700)
  }

  async _fetchNewPage() {
    const url = new URL(this.urlValue);

    if (this.inputTarget.value){
      url.searchParams.set('search_term', this.inputTarget.value)
    }

    if (this.categoryTarget.value) {
      url.searchParams.set('category', this.categoryTarget.value)
    }

    await get(url.toString(), {
      responseKind: 'turbo-stream'
    });
  }
    
}