import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-sidebar',
  templateUrl: './sidebar.component.html',
  styleUrls: ['./sidebar.component.css']
})
export class SidebarComponent implements OnInit {

  constructor(private router: Router) { }
  activeElement: HTMLElement | undefined;
  isToggle: boolean = false;
  type: string = '';
  ngOnInit(): void {
    let path = location.pathname.slice(1);
    this.active(document.getElementById((path == '') ? 'Home' : path)!);
  }
  toggle(): void {
    this.isToggle = !this.isToggle;
  }
  active(element: HTMLElement) {
    if (this.activeElement?.id != element?.id) {
      element.classList.add('active');
      if (this.activeElement != undefined) { this.activeElement.classList.remove('active'); }
      this.activeElement = element;
    }
  }
  logout() {
    localStorage.removeItem("token");
    localStorage.removeItem("user");
    this.router.navigate(['/Login']);
  }
}
