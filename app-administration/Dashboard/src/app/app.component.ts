import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent implements OnInit {
  routeName: string = '';
  constructor(router: Router) {
    // decide what to do when this event is triggered.
    router.events.subscribe(val => {
      let urlSplitted = window.location.href.split('/');
      // this.routeName = urlSplitted[urlSplitted.length - 1];
      if (urlSplitted[urlSplitted.length - 1] == "Login") {
        this.routeName = "Login";
      }
    });
  }
   ngOnInit(): void {
  }
}

