// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import {Turbo} from "@hotwired/turbo-rails"

window.Turbo = Turbo
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "chartkick"
import "chart.js"
import "choices.js"
import "alpinejs"
import Sortable from 'sortablejs'
// ActiveStorage.start()
Rails.start()


import debounced from 'debounced'

debounced.initialize()

// import "/controllers"
import "../css/application.css"

window.addEventListener('turbo:load', () => {
    console.log("Sortable: ", Sortable);
    const el = document.querySelector("#tasks-list");
    const sortable = Sortable.create(el, { animation: 150 });
})
import "controllers"
