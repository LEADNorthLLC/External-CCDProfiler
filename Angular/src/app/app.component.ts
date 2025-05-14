// src/app/app.component.ts
import { Component } from '@angular/core';
import { RouterOutlet, RouterLink, RouterLinkActive, Router, NavigationEnd } from '@angular/router';
import { CommonModule } from '@angular/common';
import { Observable, Subscription, filter, map, startWith } from 'rxjs';

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [RouterOutlet, RouterLink, RouterLinkActive, CommonModule],
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  title = 'LN-DPT';
  currentPageTitle = 'Dashboard';
  isSidebarOpen = true;
  currentYear = new Date().getFullYear();

  constructor(private router: Router) {
    this.router.events.pipe(
      filter(event => event instanceof NavigationEnd)
    ).subscribe(() => {
      this.updatePageTitle();
    });
  }

  private updatePageTitle(): void {
    const path = this.router.url.split('/')[1];
    this.currentPageTitle = this.getTitleFromPath(path);
  }

  private getTitleFromPath(path: string): string {
    switch(path) {
      case 'index':
        return 'Dashboard';
      case 'data-importer':
        return 'Import Data';
      case 'reports':
        return 'Reports';
      case 'settings':
        return 'Configuration';
      case 'help-page':
        return 'Help';
      default:
        return 'Dashboard';
    }
  }

  toggleSidebar(): void {
    this.isSidebarOpen = !this.isSidebarOpen;
  }
}
