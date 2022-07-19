import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-sidebar',
  templateUrl: './sidebar.component.html',
  styleUrls: ['./sidebar.component.css']
})
export class SidebarComponent implements OnInit {

  constructor() { }
  isToggle: boolean = false;
  ngOnInit(): void {

  }
  toggle(): void {
    this.isToggle = !this.isToggle;
  }

  onToggleLinks(): object {
    return { 'fs-5': this.isToggle, 'text-center': this.isToggle }
  }
  onToggleSpans(): object {
    return { 'd-none': this.isToggle }
  }
  onToggleSideBar(): object {
    return { 'min-sidebar': this.isToggle, 'max-sidebar': !this.isToggle }
  }
  onToggleButton(): object {
    return { 'text-center': this.isToggle, 'ms-auto': !this.isToggle }
  }

}
