import { Controller } from "@hotwired/stimulus";
import { get } from '@rails/request.js'

export default class extends Controller {
  static values = {
    url: String,
    page: Number,
    request: Boolean,
    searchTerm: String,
  };

  static targets = [ "lastPage" ]

  initialize() {
    this.scroll = this.scroll.bind(this);
    this.pageValue = this.pageValue || 1;
  }

  connect() {
    document.addEventListener("scroll", this.scroll);
  }

  disconnect(){
    document.removeEventListener("scroll", this.scroll);
  }

  scroll() {
    if (!this.requestValue && !this.hasLastPageTarget && this.scrollReachedEnd ) {
      this._fetchNewPage();
    }
  }

  async _fetchNewPage() {
    const url = new URL(this.urlValue);
    url.searchParams.set('page', this.pageValue)
    if (this.searchTermValue){
      url.searchParams.set('search_term', this.searchTermValue)
    }
    this.requestValue = true;
    await get(url.toString(), {
      responseKind: 'turbo-stream'
    });
    this.requestValue = false;
    this.pageValue +=1;
  }
    

  get scrollReachedEnd() {
      const { scrollHeight, scrollTop, clientHeight } = document.documentElement;
      const distanceFromBottom = scrollHeight - scrollTop - clientHeight;
      if (distanceFromBottom < 20){
        document.documentElement.scrollTop = scrollHeight - 200
      }
      return distanceFromBottom < 20;
  }
}