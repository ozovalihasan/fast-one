import { Controller } from "@hotwired/stimulus"
import { get } from '@rails/request.js'

export default class extends Controller {
  static targets = [ "input" ]

  static values = {
    url: String,
    searchTerm: String,
    origin: String,
  };

  search() {
    clearTimeout(this.timeout)
    this.timeout = setTimeout(() => {
      this._fetchNewPage();
    }, 700)
  }

  async _fetchNewPage() {
    const url = new URL(this.urlValue);
    url.searchParams.set('search_term', this.inputTarget.value)
    url.searchParams.set('origin', this.originValue)
    console.warn(this.originValue);
    console.warn("hasan");
    await get(url.toString(), {
      responseKind: 'turbo-stream'
    });
  }
    
}