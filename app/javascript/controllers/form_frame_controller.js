import { Controller } from "@hotwired/stimulus";
import { destroy } from '@rails/request.js'

export default class extends Controller {
    static values = { url: String };


    submit() {
        event.preventDefault();
        this._fetchNewPage()
    }

    async _fetchNewPage() {

        const url = new URL(this.urlValue);
        
        url.searchParams.set
        let response = await destroy(url.toString(), {
            responseKind: 'html',
            headers: {
                "Turbo-Frame": "primary",
            },

        });

        if (response.ok) {
            window.history.replaceState('','', `${response.response.url}#removed`)
            const body = await response.text
            document.querySelector('#primary').outerHTML = body

        }
        
        
    }
}